import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:peluquerias/config/blocs/location/location_bloc.dart';
import 'package:peluquerias/config/theme/themes.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {

  final LocationBloc locationBloc;

  GoogleMapController? _mapController;

  MapBloc({
    required this.locationBloc
    }) : super(const MapState()) {

    on<OnMapInitialzedEvent>( _onInitMap );
    on<OnStartFollowingUserEvent>( _onStartFollowingUser );
    on<OnStopFollowingUserEvent>((event, emit) => emit( state.copyWith( followUser: false ) ));

    locationBloc.stream.listen(( locationState ) {

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
}
