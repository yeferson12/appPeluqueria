part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool followUser;
  final bool infoMarkerBarbe;
  final bool isOpenMenuCircule;
  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;
  final Map<String, Marker> allMarkers;
  final Map<String, BarberResponse> markerToBarber;
  final BarberResponse? selectedBarber;

  const MapState({
    this.isMapInitialized = false, 
    this.followUser = true,
    this.infoMarkerBarbe = false,
    this.isOpenMenuCircule = false,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers,
    Map<String, Marker>? allMarkers,
    Map<String, BarberResponse>? markerToBarber,
    this.selectedBarber
  }): polylines = polylines ?? const {},
      markers = markers ?? const {},
      allMarkers = allMarkers ?? const {},
      markerToBarber = markerToBarber ?? const {};


  MapState copyWith({
    bool? isMapInitialized,
    bool? followUser,
    bool? infoMarkerBarbe,
    bool? isOpenMenuCircule,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers,
    Map<String, Marker>? allMarkers,
    BarberResponse? selectedBarber,
    Map<String, BarberResponse>? markerToBarber,
  }) {
   return MapState(
    isMapInitialized: isMapInitialized ?? this.isMapInitialized,
    followUser: followUser ?? this.followUser,
    polylines: polylines ?? this.polylines,
    markers: markers ?? this.markers,
    allMarkers: allMarkers ?? this.allMarkers,
    infoMarkerBarbe: infoMarkerBarbe ?? this.infoMarkerBarbe,
    markerToBarber: markerToBarber ?? this.markerToBarber,
    selectedBarber: selectedBarber ?? this.selectedBarber,
    isOpenMenuCircule: isOpenMenuCircule ?? this.isOpenMenuCircule,
  );
   }

  @override
  List<Object> get props => [ 
    isMapInitialized, 
    followUser, 
    polylines, 
    markers, 
    allMarkers,
    infoMarkerBarbe, 
    markerToBarber, 
    isOpenMenuCircule,
    selectedBarber ?? BarberResponse(id: 0, img: '',name: '',location: const LatLng(40.43455, -34.345345), imgBarber: [])
    ];
}
