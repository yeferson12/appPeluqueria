import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class BarberResponse {
  final int id;
  final String img;
  final String name;
  final LatLng location;
  final List<ReviewsModal>? review;
  final List<ImgsBarber> imgBarber;

  BarberResponse(  {
    required this.id, 
    required this.img, 
    required this.name, 
    required this.location, 
    this.review,
    required this.imgBarber,
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

class ImgsBarber {
  final String imgBarber;

  ImgsBarber({
    required this.imgBarber,
  });
}