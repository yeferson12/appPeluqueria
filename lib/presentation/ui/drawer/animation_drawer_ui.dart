import 'dart:math';
import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../config/blocs/blocs.dart';
import '../../views/views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widgets.dart';
import 'dart:math' as math;


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
    
    final size = MediaQuery.of(context).size;

    List<IconData> icons = [
      Icons.location_searching_outlined,
      Icons.directions_run_rounded,
      Icons.directions_car_filled_sharp,
      Icons.minor_crash_sharp,
    ];

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
                                alignment: Alignment.bottomCenter,
                                children: [

                                  MapView(
                                    initialLocation: initialLocation,
                                    polylines: polylines,
                                    markers: markers,
                                  ),

                                  if( state.isOpenMenuCircule )
                                   _CircularMenu(icons: icons),

                                  const InfobarberBody(),

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

class _CircularMenu extends StatelessWidget {
  const _CircularMenu({
    super.key,
    required this.icons,
  });

  final List<IconData> icons;

  @override
  Widget build(BuildContext context) {

    final locationBloc = BlocProvider.of<LocationBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    
    return Positioned(
     bottom: - 90,
       child: CircleAvatar(
         backgroundColor:  const Color(0xff0088E0),
         maxRadius: 100,
         child: Stack(
           alignment: Alignment.center,
           children: [
             for (int i = 0; i < icons.length; i++)
               Positioned(
                 left: 90 + 70 * math.cos(i * math.pi / 3),
                 top: 80 - 65 * math.sin(i * math.pi / 3),
                 child: GestureDetector(
                  onTap: () {
                    if ( icons[0] == icons[i]) {

                      final userLocation = locationBloc.state.lastKnownLocation;

                     mapBloc.moveCamera(userLocation!);

                    }
                  },
                  child: Icon(icons[i])
                  ),
               ),
           ],
         ),
       ),
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
      child: BlocBuilder<BarberInfoBloc, BarberInfoState>(
        builder: (context, stateBarberInfo) {
          return Stack(
            children: [
               Positioned(
                top: 50,
                left: 20,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(stateBarberInfo.selectedBarber!.img),
                ),
              ),
               Positioned(
                top: 60,
                left: 90,
                child: Text(
                  stateBarberInfo.selectedBarber!.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: 100,
                left: 75,
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.location_on, color: Colors.white,),
                      onPressed: () async {
                        infoBarber.add(OnBackInfoBarberEvent());
                        
                        mapBloc.add(OnOpenCircleMenuEvent());
                        
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
                      icon: const Icon(Icons.message, color: Colors.white,),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.info_outline, color: Colors.white,),
                      onPressed: () {
                        infoBarber.add(OnInfoBarberEvent());
                      },
                    ),
                  ],
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
          );
        },
      ),
    );
  }
}
