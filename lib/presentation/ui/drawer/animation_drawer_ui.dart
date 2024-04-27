import 'dart:math';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../config/blocs/blocs.dart';
import '../../views/views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widgets.dart';

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
    return BlocBuilder<BarberInfoBloc, BarberInfoState>(
      builder: (context, stateInfoBarber) {
        return stateInfoBarber.infoBarber 
        ? BounceInDown(
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.black.withOpacity(0.1), // Fondo transparente
                  ),
                ),
              ),
              const Center(
                child: Text(
                  'Contenido aquí',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )
        : Container();
      },
    );
  }
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
              backgroundImage: AssetImage('ruta_de_la_imagen.jpg'),
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
                    final start = locationBloc.state.lastKnownLocation;
                    if ( start == null ) return;

                    final end = mapBloc.mapCenter;
                    if ( end == null ) return;


                    final destination = await searchBloc.getCoorsStartToEnd(start, end);
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
