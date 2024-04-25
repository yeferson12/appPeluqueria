import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../config/blocs/blocs.dart';
import '../../views/views.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(bottom: 80, left: 5, right: 5),
          child: ClipRRect(
              borderRadius: state.isTab == 0
                  ? const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    )
                  : BorderRadius.zero,
              child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: state.isTab.toDouble()),
                  duration: const Duration(milliseconds: 500),
                  builder: (_, double val, __) {
                    return (Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..setEntry(0, 3, 200 * val)
                        ..rotateY((pi / 5) * val),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(60)),
                        child: Scaffold(
                          body: MapView(
                            initialLocation: initialLocation,
                            polylines: polylines,
                            markers: markers,
                          ),
                          // bottomNavigationBar:
                          //     CustomBottomNavigation(currenIndex: pageIndex),
                        ),
                      ),
                    ));
                  })),
        );
      },
    );
  }
}
