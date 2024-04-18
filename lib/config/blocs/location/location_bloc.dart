import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {

  StreamSubscription<Position>? positionStream;

  LocationBloc() : super(const LocationState()) {
    on<LocationEvent>((event, emit) {});
  }

   Future getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition();
    print('position : $position');
    // add( OnNewUserLocationEvent( LatLng( position.latitude, position.longitude ) ) );
  }

  void startFollowingUser() {
    
    // add(OnStartFollowingUser());
    
    positionStream = Geolocator.getPositionStream().listen((event) {
      final position = event;
      print('startFollowingUser : $position');
    //   add( OnNewUserLocationEvent( LatLng( position.latitude, position.longitude ) ) );
    });

  }

  void stopFollowingUser() {
    positionStream?.cancel();
    // add( OnStopFollowingUser());
    print('stopFollowingUser');
  }

  @override
  Future<void> close() {
    stopFollowingUser();
    return super.close();
  }
}
