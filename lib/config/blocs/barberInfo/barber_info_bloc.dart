import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:peluquerias/config/blocs/blocs.dart';

import '../../../infrastruture/models/models.dart';

part 'barber_info_event.dart';
part 'barber_info_state.dart';

class BarberInfoBloc extends Bloc<BarberInfoEvent, BarberInfoState> {

  final MapBloc mapBloc ;

  StreamSubscription<MapState>? mapBlocStateSubscription ;

  BarberInfoBloc({required this.mapBloc}) : super(const BarberInfoState()) {
    on<OnInfoBarberEvent>((event, emit) => emit( state.copyWith( infoBarber: true ) ));
    on<OnBackInfoBarberEvent>((event, emit) => emit( state.copyWith( infoBarber: false ) ));
    on<OnGetInfoBarberEvent>((event, emit) => emit( state.copyWith( selectedBarber: event.selectedBarber ) ));

    mapBlocStateSubscription = mapBloc.stream.listen(( mapState ) {

      if (mapState.selectedBarber != null) {
        getInfoBarber(mapState.selectedBarber!);
      } 
    });
  }

  void getInfoBarber( BarberResponse reviews ) {
    add(OnGetInfoBarberEvent( reviews ));
  }

  void goToNextBarber() {
    final nextMarker = mapBloc.getNextBarberMarker();
    if (nextMarker != null) {
      final nextBarber = getBarberByMarker(nextMarker);
      if (nextBarber != null) {
        mapBloc.moveCamera(nextBarber.location);
        add(OnGetInfoBarberEvent(nextBarber));
      }
    }
  }

  void goToPreviusBarber() {
    final previousMarker = mapBloc.getPreviousBarberMarker();
    if (previousMarker != null) {
      final previousBarber = getBarberByMarker(previousMarker);
      if (previousBarber != null) {
        mapBloc.moveCamera(previousBarber.location);
        add(OnGetInfoBarberEvent(previousBarber));
      }
    }
  }

  BarberResponse? getBarberByMarker(Marker marker) {
  return mapBloc.state.markerToBarber[marker.markerId.value];
}


   @override
  Future<void> close() {
    mapBlocStateSubscription?.cancel();
    return super.close();
  }

}
