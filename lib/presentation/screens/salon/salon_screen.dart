import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/blocs/blocs.dart';


class SalonScreen extends StatelessWidget {
  const SalonScreen({super.key});
  static const name = 'salon-screen';

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: const EdgeInsets.only(bottom: 80, left: 5, right: 5),
          child:  ClipRRect(
              borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
              child: TweenAnimationBuilder(
                  tween: Tween<double>(
                      begin: 0, end: 0),
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
                          return  ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(60)),
                            child: Scaffold(
                              body: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [

                                  Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    color: Colors.white,
                                    child: Center(child: Text("aca va a empezar"),),
                                  )

                                  // if( state.isOpenMenuCircule )
                                  //  _CircularMenu(icons: icons),

                                  // const InfobarberBody(),

                                  //  HeaderWaveGradient(
                                  //     heightPercentage: state.infoMarkerBarbe,
                                  //   ),

                                  // if (state.infoMarkerBarbe)
                                  //   const _InfoBarberHeader()
                                    
                                ],
                              ),

                              // bottomNavigationBar:
                              //     CustomBottomNavigation(currenIndex: pageIndex),
                            ),
                          );
                        },
                      ),
                    ));
                  })
              ),
        );
  }
}