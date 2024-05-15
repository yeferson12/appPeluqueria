part of 'map_bloc.dart';

class MapState extends Equatable {
  final bool isMapInitialized;
  final bool followUser;
  final bool infoMarkerBarbe;
  final bool isOpenMenuCircule;
  final Map<String, Polyline> polylines;
  final Map<String, Marker> markers;
  final List<BarberResponse> infoByBarber;
  final BarberResponse? selectedBarber;

  const MapState({
    this.isMapInitialized = false, 
    this.followUser = true,
    this.infoMarkerBarbe = false,
    this.isOpenMenuCircule = false,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers,
    List<BarberResponse>? infoByBarber,
    this.selectedBarber
  }): polylines = polylines ?? const {},
      markers = markers ?? const {},
      infoByBarber = infoByBarber ?? const [];


  MapState copyWith({
    bool? isMapInitialized,
    bool? followUser,
    bool? infoMarkerBarbe,
    bool? isOpenMenuCircule,
    Map<String, Polyline>? polylines,
    Map<String, Marker>? markers,
    BarberResponse? selectedBarber,
    List<BarberResponse>? infoByBarber,
  }) 
  => MapState(
    isMapInitialized: isMapInitialized ?? this.isMapInitialized,
    followUser: followUser ?? this.followUser,
    polylines: polylines ?? this.polylines,
    markers: markers ?? this.markers,
    infoMarkerBarbe: infoMarkerBarbe ?? this.infoMarkerBarbe,
    infoByBarber: infoByBarber ?? this.infoByBarber,
    selectedBarber: selectedBarber ?? this.selectedBarber,
    isOpenMenuCircule: isOpenMenuCircule ?? this.isOpenMenuCircule,
  );

  @override
  List<Object> get props => [ 
    isMapInitialized, 
    followUser, 
    polylines, 
    markers, 
    infoMarkerBarbe, 
    infoByBarber, 
    isOpenMenuCircule,
    selectedBarber ?? BarberResponse(id: 0, img: '',name: '',location: LatLng(40.43455, -34.345345), imgBarber: [])
    ];
}
