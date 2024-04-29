import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class BarberResponse {
  final int id;
  final String name;
  final LatLng location;
  final List<ReviewsModal> review;

  BarberResponse(  {
    required this.id, 
    required this.name, 
    required this.location, 
    required this.review,
    });
}


class ReviewsModal {
  final int idBarber;
  final String nombre;
  final String comentario;
  final int estrellas;
  final String date;

  ReviewsModal({
    required this.idBarber,
    required this.nombre,
    required this.comentario,
    required this.estrellas,
    required this.date,
  });
}