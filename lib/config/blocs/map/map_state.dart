part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool followUser;
  final bool infoMarkerBarbe;
  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;

  const MapState({
    this.isMapInitialized = false, 
    this.followUser = true,
    this.infoMarkerBarbe = false,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers
  }): polylines = polylines ?? const {},
      markers = markers ?? const {};


  MapState copyWith({
    bool? isMapInitialized,
    bool? followUser,
    bool? infoMarkerBarbe,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers
  }) 
  => MapState(
    isMapInitialized: isMapInitialized ?? this.isMapInitialized,
    followUser: followUser ?? this.followUser,
    polylines: polylines ?? this.polylines,
    markers: markers ?? this.markers,
    infoMarkerBarbe: infoMarkerBarbe ?? this.infoMarkerBarbe,
  );

  @override
  List<Object> get props => [ isMapInitialized, followUser, polylines, markers, infoMarkerBarbe];
}
