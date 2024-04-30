import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:peluquerias/config/blocs/location/location_bloc.dart';
import 'package:peluquerias/config/theme/themes.dart';

import '../../../infrastruture/models/models.dart';
import '../../../presentation/services/services.dart';
import '../../helpers/helpers.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {

  final LocationBloc locationBloc;
  GoogleMapController? _mapController;
  LatLng? mapCenter;

  StreamSubscription<LocationState>? locationStateSubscription;

  MapBloc({
    required this.locationBloc
    }) : super(const MapState()) {

    on<OnMapInitialzedEvent>( _onInitMap );
    on<OnStartFollowingUserEvent>( _onStartFollowingUser );
    on<OnStopFollowingUserEvent>((event, emit) => emit( state.copyWith( followUser: false ) ));
    on<DisplayPolylinesEvent>((event, emit) => emit( state.copyWith( polylines: event.polylines, markers: event.markers ) ));
    on<OnGetMarkersBarber>( (event, emit) => emit( state.copyWith( markers: event.markers )), );
    on<OnInfoMarkerBarberEvent>((event, emit) => emit( state.copyWith( infoMarkerBarbe: true ) ));
    on<OnCloseInfoMarkerBarberEvent>((event, emit) => emit( state.copyWith( infoMarkerBarbe: false ) ));
    on<OnClearPolylinesEvent>( onClearPolylinesEvent );
    on<OnGetInfoBarber>(  (event, emit) => emit( state.copyWith( infoByBarber: event.infoByBarber )) );
    on<OnSelectBarberEvent>(  (event, emit) => emit( state.copyWith( selectedBarber: event.barber )) );

    locationStateSubscription = locationBloc.stream.listen(( locationState ) {

      if ( !state.followUser ) return;
      if( locationState.lastKnownLocation == null ) return;

      moveCamera( locationState.lastKnownLocation! );
    });
    
  }

   void _onInitMap( OnMapInitialzedEvent event, Emitter<MapState> emit ) {

    _mapController = event.controller;
    _mapController!.setMapStyle( jsonEncode( mapTheme ));

    emit( state.copyWith( isMapInitialized: true ) );

  }


  void moveCamera( LatLng newLocation ) {
    final cameraUpdate = CameraUpdate.newLatLng( newLocation );
    _mapController?.animateCamera(cameraUpdate);
  }

  void onClearPolylinesEvent(OnClearPolylinesEvent event, Emitter<MapState> emit) {
  emit(state.copyWith(polylines: {}));
}

  void _onStartFollowingUser(OnStartFollowingUserEvent event, Emitter<MapState> emit) {

    emit( state.copyWith( followUser: true ) );

    if( locationBloc.state.lastKnownLocation == null ) return;
    moveCamera(locationBloc.state.lastKnownLocation!);

  }

  Future drawRoutePolyline( RouteDestination destination ) async {

    final myRoute = Polyline(
      polylineId: const PolylineId('route'),
      color: Colors.black,
      width: 5,
      points: destination.points,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
    );

    double kms = destination.distance / 1000;
    kms = (kms * 100).floorToDouble();
    kms /= 100;

    //* este codigo sirve para hacer markes perzonalizados
    // int tripDuration = (destination.duration / 60).floorToDouble().toInt();
    // final startMaker = await getMarkerPainterBitmap( StartMarkerPainter(minutes: tripDuration, destination: 'Mi ubicación') );
    // final endMaker = await getMarkerPainterBitmap( EndMarkerPainter(kilometers: kms.toInt(), destination: destination.endPlace.properties.name) );


   //* este codigo es para crear los markes
    // final startMarker = Marker(
    //   anchor: const Offset(0.1, 1),
    //   markerId: const MarkerId('start'),
    //   position: destination.points.first,
    // );

    // final endMarker = Marker(
    //   markerId: const MarkerId('end'),
    //   position: destination.points.last,
    // );


    final curretPolylines = Map<String, Polyline>.from( state.polylines );
    curretPolylines['route'] = myRoute;


    final currentMarkers = Map<String, Marker>.from( state.markers );

    // currentMarkers['start'] = startMarker;
    // currentMarkers['end'] = endMarker;


    add( DisplayPolylinesEvent( curretPolylines, currentMarkers ) );

    // await Future.delayed( const Duration( milliseconds: 300 ));
    // _mapController?.showMarkerInfoWindow(const MarkerId('start'));

  }

  Future getBarberMarkes( ) async {

    final LocationBarberservices barberService = LocationBarberservices();

    final barbers = await barberService.getLocationBarberService();
    final markers = <String, Marker>{};
    final List<ReviewsModal> review = [];

    final iconBarber = await getAssetImageMarker( img: 'assets/barber1.png', size: 5 );

      barbers.asMap().forEach((index, barber) {

    final marker = Marker(
      markerId: MarkerId('${barber.name}_$index'),
      position: barber.location,
      icon: iconBarber,
      onTap: () {
        
        review.clear();
        add( OnInfoMarkerBarberEvent() );

        if( barber.review != null) {
          for (var itemReview in barber.review!) {

              if (itemReview.idBarber ==  barber.id) {
                review.add(itemReview);  
          }
          }
        }

        
        final  barberResponse = BarberResponse(
          id: barber.id,
          img: barber.img,
          name: barber.name,
          location: barber.location,
          review: review,
         );
         add(OnSelectBarberEvent(barberResponse));
      },
    );

    markers['${barber.name}_$index'] = marker;
  });

  
  add(OnGetMarkersBarber(markers));

  }

  @override
  Future<void> close() {
    locationStateSubscription?.cancel();
    return super.close();
  }
}
