part of 'map_bloc.dart';

sealed class MapEvent extends Equatable {
  const MapEvent();

  @override
  List<Object> get props => [];
}

class OnMapInitialzedEvent extends MapEvent {
  final GoogleMapController controller;
  const OnMapInitialzedEvent(this.controller);
}

class OnStopFollowingUserEvent extends MapEvent {}
class OnStartFollowingUserEvent extends MapEvent {}

class OnInfoMarkerBarberEvent extends MapEvent {}
class OnCloseInfoMarkerBarberEvent extends MapEvent {}

class OnOpenCircleMenuEvent extends MapEvent {}
class OnCloseInfoCircleMenuEvent extends MapEvent {}

class DisplayPolylinesEvent extends MapEvent {
  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;
  const DisplayPolylinesEvent(this.polylines, this.markers);
}

class OnGetMarkersBarber extends MapEvent {
  final Map<String, Marker> markers;
  const OnGetMarkersBarber(this.markers);
}
class OnGetInfoBarber extends MapEvent {
  final List<BarberResponse> infoByBarber;
  const OnGetInfoBarber(this.infoByBarber);
}

class OnSelectBarberEvent extends MapEvent {
  final BarberResponse barber;
  const OnSelectBarberEvent(this.barber);
}

class OnClearPolylinesEvent extends MapEvent {}
