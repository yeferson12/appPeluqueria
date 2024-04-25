import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:peluquerias/infrastruture/models/models.dart';




class LocationBarberservices {


  LocationBarberservices();


  Future<List<BarberResponse>> getLocationBarberService() async {

   final List<BarberResponse> barbers = [
    BarberResponse(name: 'Peluquería A', location: const LatLng(40.461577, -3.478715)),
    BarberResponse(name: 'Peluquería B', location: const LatLng(40.464044, -3.472113)),
    // Añade más ubicaciones de peluqueros según sea necesario
  ];
  return barbers;
  }

}