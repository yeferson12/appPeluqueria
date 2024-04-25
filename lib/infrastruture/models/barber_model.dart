import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class BarberResponse {
  final String name;
  final LatLng location;

  BarberResponse({required this.name, required this.location});
}