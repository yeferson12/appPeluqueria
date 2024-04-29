import 'dart:math';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:peluquerias/infrastruture/models/models.dart';

import '../../../config/blocs/blocs.dart';
import '../../views/views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimationDrawer extends StatelessWidget {
  const AnimationDrawer({
    super.key,
    required this.initialLocation,
    required this.polylines,
    required this.markers,
  });

  final LatLng initialLocation;
  final Set<Polyline> polylines;
  final Set<Marker> markers;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerBloc, DrawerState>(
      builder: (context, stateDrawer) {
        return Container(
          margin: stateDrawer.isTab == -1 || stateDrawer.isTab == 1
              ? const EdgeInsets.only(bottom: 80)
              : const EdgeInsets.only(bottom: 80, left: 5, right: 5),
          child: ClipRRect(
              borderRadius: stateDrawer.isTab == 0
                  ? const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    )
                  : BorderRadius.zero,
              child: TweenAnimationBuilder(
                  tween: Tween<double>(
                      begin: 0, end: stateDrawer.isTab.toDouble()),
                  duration: const Duration(milliseconds: 500),
                  builder: (_, double val, __) {
                    return (Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..setEntry(0, 3, 200 * val)
                        ..rotateY((pi / 5) * val),
                      child: BlocBuilder<MapBloc, MapState>(
                        builder: (context, state) {
                          return ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(60)),
                            child: Scaffold(
                              body: Stack(
                                children: [
                                  MapView(
                                    initialLocation: initialLocation,
                                    polylines: polylines,
                                    markers: markers,
                                  ),
                                  const _InfobarberBody(),
                                  HeaderWaveGradient(
                                    heightPercentage: state.infoMarkerBarbe,
                                  ),
                                  if (state.infoMarkerBarbe)
                                    const _InfoBarberHeader()
                                ],
                              ),

                              // bottomNavigationBar:
                              //     CustomBottomNavigation(currenIndex: pageIndex),
                            ),
                          );
                        },
                      ),
                    ));
                  })),
        );
      },
    );
  }
}

class _InfobarberBody extends StatelessWidget {
  const _InfobarberBody({
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
                            SizedBox(height: size.height * 0.28),
                            Container(
                              width: size.width * 0.8,
                              height: size.height * 0.20,
                              padding: const EdgeInsets.all(20),
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Colors.purple.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Column(
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
                            _ListEmployes(listAvatar: svgList),
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

class _ListEmployes extends StatelessWidget {
  final List<InfoEmployesModel> listAvatar;

  const _ListEmployes({
    super.key,
    required this.listAvatar,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
        height: size.height * 0.15,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listAvatar.length,
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Transform.rotate(
                    angle: 90 * 3.1415927 / 180,
                    child: SvgPicture.asset(
                      'assets/svg/cuchilla.svg',
                      width: size.height * 0.2,
                      height: size.height * 0.15,
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 33,
                    child: ClipOval(
                      child: Container(
                        width: size.height * 0.08,
                        height: size.height * 0.08,
                        color: Colors.white,
                        child: SvgPicture.asset(
                          listAvatar[index].svgPath,
                          width: size.height * 0.2,
                          height: size.height * 0.15,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 33,
                    child: CircleRedGreenWidget(
                        isActivite: listAvatar[index].isActive),
                  ),
                  Positioned(
                    left: 42,
                    top: 110,
                    child: Text(listAvatar[index].nameBarber),
                  ),
                ],
              );
            }));
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
                color: Colors.white,
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
          Icon(icon, color: Colors.white),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Expanded(child: Container()),
          duration != ''
              ? Text(
                  duration,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              : GestureDetector(
                  child: Icon(iconModal, color: Colors.white),
                  onTap: () {
                    _showCustomModal(context, size);
                  })
        ],
      ),
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
                      itemCount: state.reviews.length,
                      itemBuilder: (context, index) {
                        // Aquí debes obtener el comentario, el nombre del usuario y la fecha
                        // Puedes hacerlo desde la lista `comentarios` que contiene la información
                        return _buildComentarioWidget( state.reviews[index] );
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

Widget _buildComentarioWidget( ReviewsModal reviews) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(5, (index) {
                  return const Icon(Icons.star, size: 36, color: Colors.yellow);
                }),
              ),
      const SizedBox(height: 8),
      // Texto del comentario
      Text(
        reviews.comentario,
        style: const TextStyle(fontSize: 16),
      ),
      const SizedBox(height: 4),
      // Nombre del usuario y fecha de publicación
      Row(
        children: [
          Text(
            reviews.nombre,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 8),
          Text(
            'Publicado hace ${reviews.date}',
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
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Row(
          children: List.generate(5, (index) {
            if (index < stars) {
              return Icon(Icons.star, color: Colors.yellow);
            } else {
              return Icon(Icons.star_border, color: Colors.grey);
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

class _InfoBarberHeader extends StatelessWidget {
  const _InfoBarberHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final infoBarber = BlocProvider.of<BarberInfoBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    final locationBloc = BlocProvider.of<LocationBloc>(context);

    return SlideInDown(
      child: Stack(
        children: [
          const Positioned(
            top: 50,
            left: 20,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/barber1.png'),
            ),
          ),
          const Positioned(
            top: 60,
            left: 90,
            child: Text(
              'Nombre del Barbero',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 100,
            left: 90,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.location_on),
                  onPressed: () async {
                    infoBarber.add(OnBackInfoBarberEvent());

                    final start = locationBloc.state.lastKnownLocation;
                    if (start == null) return;

                    final end = mapBloc.mapCenter;
                    if (end == null) return;

                    final destination =
                        await searchBloc.getCoorsStartToEnd(start, end);
                    await mapBloc.drawRoutePolyline(destination);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.message),
                  onPressed: () {
                    // Acción al presionar el botón de ubicación
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.info_outline),
                  onPressed: () {
                    infoBarber.add(OnInfoBarberEvent());
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.cancel_outlined),
              onPressed: () {
                infoBarber.add(OnBackInfoBarberEvent());
                mapBloc.add(OnCloseInfoMarkerBarberEvent());
                mapBloc.add(OnClearPolylinesEvent());
              },
            ),
          ),
          // Positioned(
          //   top: 170,
          //   left: 175,
          //   child: IconButton(
          //     icon: const Icon(Icons.cancel_outlined, size: 30,),
          //     onPressed: () {
          //       // Acción al presionar el botón de flecha hacia arriba
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
