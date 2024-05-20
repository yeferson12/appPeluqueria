

import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/blocs/blocs.dart';
import '../../../infrastruture/models/models.dart';
import '../../widgets/widgets.dart';


class InfobarberBody extends StatelessWidget {
  const InfobarberBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<BarberInfoBloc, BarberInfoState>(
      builder: (context, stateInfoBarber) {
        return stateInfoBarber.infoBarber
            ? Stack(
                children: [
                  BounceInDown(
                    duration: const Duration(seconds: 1),
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          color: Colors.transparent, // Fondo transparente
                        ),
                      ),
                    ),
                  ),
                  BounceInDown(
                    duration: const Duration(seconds: 1),
                    child: SingleChildScrollView(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: size.height * 0.26),
                            Container(
                              width: size.width * 0.8,
                              height: size.height * 0.20,
                              padding: const EdgeInsets.all(20),
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                // color: Colors.purple.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child:  const Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _InfoStoreInitial(
                                      text: 'LLega en: ',
                                      duration: '30mn',
                                      icon: Icons.directions_run_outlined),
                                  _InfoStoreInitial(
                                      text: 'Horario de apertura: ',
                                      duration: '',
                                      icon: Icons.access_time),
                                  _InfoStoreInitial(
                                      text: 'Duracion: ',
                                      duration: '30mn',
                                      icon: Icons.access_time),
                                  _Reviews(),
                                ],
                              ),
                            ),
                            const Text(
                              'Conoce a nuestro equipo',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            // _ListEmployes(listAvatar: svgList),
                            ImgSlideShow(imgBarber: stateInfoBarber.selectedBarber!.imgBarber)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Container();
      },
    );
  }
}

class _InfoStoreInitial extends StatelessWidget {
  final IconData icon;
  final String text;
  final String duration;
  final IconData iconModal;

  const _InfoStoreInitial({
    required this.icon,
    required this.text,
    required this.duration,
    this.iconModal = Icons.arrow_forward_ios_outlined,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.028,
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Expanded(child: Container()),
          duration != ''
              ? Text(
                  duration,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )
              : GestureDetector(
                  child: Icon(iconModal, color: Colors.black),
                  onTap: () {
                    _showCustomModal(context, size);
                  })
        ],
      ),
    );
  }
}

final List<InfoEmployesModel> svgList = [
  InfoEmployesModel(
      nameBarber: 'Yeferson',
      svgPath: 'assets/svg/avatar1.svg',
      isActive: true),
  InfoEmployesModel(
      nameBarber: 'Juanpis',
      svgPath: 'assets/svg/avatar2.svg',
      isActive: false),
  InfoEmployesModel(
      nameBarber: 'Tina', svgPath: 'assets/svg/avatar3.svg', isActive: false),
  InfoEmployesModel(
      nameBarber: 'Emmy', svgPath: 'assets/svg/avatar4.svg', isActive: true),
  InfoEmployesModel(
      nameBarber: 'Isabell', svgPath: 'assets/svg/avatar5.svg', isActive: true),
  InfoEmployesModel(
      nameBarber: 'albert', svgPath: 'assets/svg/avatar6.svg', isActive: true),
  InfoEmployesModel(
      nameBarber: 'jonathan',
      svgPath: 'assets/svg/avatar7.svg',
      isActive: true),
  // Agrega más elementos según sea necesario
];

class _Reviews extends StatelessWidget {
  const _Reviews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => _showCustomModalReviews(context),
          child: Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(width: 1, color: Colors.purple)),
            child: const Text(
              'Reseñas',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Color.fromARGB(255, 237, 210, 8)),
            Icon(Icons.star, color: Color.fromARGB(255, 237, 210, 8)),
            Icon(Icons.star, color: Color.fromARGB(255, 237, 210, 8)),
            Icon(Icons.star, color: Color.fromARGB(255, 237, 210, 8)),
            Icon(Icons.star, color: Colors.white),
          ],
        ),
      ],
    );
  }
}

void _showCustomModal(BuildContext context, Size size) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const ListTile(
                title: Center(child: Text('Horario de Apertura')),
              ),
              _listHors('Lunes: ', '8am - 10pm', true),
              _listHors('Martes: ', '8am - 10pm', true),
              _listHors('Miercoles: ', '8am - 10pm', true),
              _listHors('Jueves: ', '8am - 10pm', true),
              _listHors('Viernes: ', '8am - 10pm', true),
              _listHors('Sabado: ', '8am - 10pm', true),
              _listHors('Domingo: ', 'Cerrado', false),
              // Agrega más contenido según sea necesario
            ],
          ),
        ),
      );
    },
  );
}

void _showCustomModalReviews(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.8,
          padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return const Icon(Icons.star, size: 36, color: Colors.yellow);
                }),
              ),
              const SizedBox(height: 8),
              const Text(
                '20 reseñas',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Sección de reseñas detalladas
              _reviewRow('Ambiente', 5),
              _reviewRow('Limpieza', 4),
              _reviewRow('Empleados', 3),
              const Divider(),
              const Text(
                'Comentarios',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              BlocBuilder<BarberInfoBloc, BarberInfoState>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: state.selectedBarber!.review!.length,
                      itemBuilder: (context, index) {
                        return _buildComentarioWidget(state.selectedBarber!.review!, index);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildComentarioWidget(List<ReviewsModal> reviews, int index) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(5, (i) {
          return const Icon(Icons.star, size: 36, color: Colors.yellow);
        }),
      ),
      const SizedBox(height: 8),
      // Texto del comentario
      Text(
        reviews[index].comentario,
        style: const TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 4),
      Row(
        children: [
          Text(
            reviews[index].nombre,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Text(
            'Publicado hace ${reviews[index].date}',
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
      const Divider(),
      const SizedBox(height: 16),
    ],
  );
}

Widget _reviewRow(String label, int stars) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          children: List.generate(5, (index) {
            if (index < stars) {
              return const Icon(Icons.star, color: Colors.yellow);
            } else {
              return const Icon(Icons.star_border, color: Colors.grey);
            }
          }),
        ),
      ],
    ),
  );
}

Widget _listHors(String title, String hora, bool isActivite) {
  return Container(
    margin: const EdgeInsets.only(bottom: 5),
    child: Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        Text(hora),
        Expanded(child: Container()),
        CircleRedGreenWidget(isActivite: isActivite),
      ],
    ),
  );
}


