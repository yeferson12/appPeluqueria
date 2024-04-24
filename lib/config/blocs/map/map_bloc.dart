import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:peluquerias/config/blocs/location/location_bloc.dart';
import 'package:peluquerias/config/theme/themes.dart';

import '../../../infrastruture/models/models.dart';
import '../../../presentation/ui/ui.dart';
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

    int tripDuration = (destination.duration / 60).floorToDouble().toInt();

    final startMaker = await getMarkerPainterBitmap( StartMarkerPainter(minutes: tripDuration, destination: 'Mi ubicación') );
    final endMaker = await getMarkerPainterBitmap( EndMarkerPainter(kilometers: kms.toInt(), destination: destination.endPlace.properties.name) );

    final startMarker = Marker(
      anchor: const Offset(0.1, 1),
      markerId: const MarkerId('start'),
      position: destination.points.first,
      icon: startMaker,
      // infoWindow: InfoWindow(
      //   title: 'Inicio',
      //   snippet: 'Kms: $kms, duration: $tripDuration',
      // )
    );

    final endMarker = Marker(
      markerId: const MarkerId('end'),
      position: destination.points.last,
      icon: endMaker,
      // anchor: const Offset(0,0),
      // infoWindow: InfoWindow(
      //   title: destination.endPlace.properties.name,
      //   snippet: destination.endPlace.properties.namePreferred,
      // )
    );


    final curretPolylines = Map<String, Polyline>.from( state.polylines );
    curretPolylines['route'] = myRoute;


    final currentMarkers = Map<String, Marker>.from( state.markers );

    currentMarkers['start'] = startMarker;
    currentMarkers['end'] = endMarker;


    add( DisplayPolylinesEvent( curretPolylines, currentMarkers ) );

    // await Future.delayed( const Duration( milliseconds: 300 ));
    // _mapController?.showMarkerInfoWindow(const MarkerId('start'));

  }

  @override
  Future<void> close() {
    locationStateSubscription?.cancel();
    return super.close();
  }
}
