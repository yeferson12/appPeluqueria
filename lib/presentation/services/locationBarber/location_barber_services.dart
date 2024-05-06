import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:peluquerias/infrastruture/models/models.dart';




class LocationBarberservices {


  LocationBarberservices();


  Future<List<BarberResponse>> getLocationBarberService() async {

  final List<BarberResponse> barbers = [
    BarberResponse(
      id: 1,
      img: 'assets/barber1.png',
      name: 'Barbería 1',
      location: const LatLng(40.461577, -3.478715), // Ejemplo de ubicación en Nueva York
      review: [
        ReviewsModal(
          idBarber: 1,
          nombre: 'Usuario 1',
          comentario: '¡Excelente servicio!',
          estrellas: 5,
          date: 'Hace 1 mes'
        ),
        ReviewsModal(
          idBarber: 1,
          nombre: 'Usuario 2',
          comentario: 'Me gustó mucho el corte de pelo.',
          estrellas: 4,
          date: 'Hace 1 mes'
        ),
      ],
      imgBarber: [
        ImgsBarber(imgBarber: 'assets/svg/avatar7.svg'),
        ImgsBarber(imgBarber: 'assets/svg/avatar6.svg'),
        ImgsBarber(imgBarber: 'assets/svg/avatar5.svg'),
        ImgsBarber(imgBarber: 'assets/svg/avatar4.svg'),
        ImgsBarber(imgBarber: 'assets/svg/avatar3.svg'),
      ]
    ),
    BarberResponse(
      id: 2,
      img: 'assets/barber1.png',
      name: 'Barbería 2',
      location: const LatLng(40.464044, -3.472113), // Ejemplo de ubicación en Los Ángeles
      review: [
        ReviewsModal(
          idBarber: 2,
          nombre: 'Usuario 3',
          comentario: 'Buen servicio, pero un poco caro.',
          estrellas: 3,
          date: 'Hace 1 mes'
        ),
      ],
      imgBarber: [
        ImgsBarber(imgBarber: 'assets/svg/avatar1.svg'),
        ImgsBarber(imgBarber: 'assets/svg/avatar2.svg'),
      ]
    ),
  ];
  return barbers;
  }

}