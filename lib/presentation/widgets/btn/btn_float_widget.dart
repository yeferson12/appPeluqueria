import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/blocs/blocs.dart';

class BtnFloatWidget extends StatelessWidget {
  const BtnFloatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapDrawer = BlocProvider.of<DrawerBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);
    final infoBarber = BlocProvider.of<BarberInfoBloc>(context);

    return BlocBuilder<DrawerBloc, DrawerState>(
      builder: (context, stateDrawer) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: CircleAvatar(
              backgroundColor: stateDrawer.isTab != 0
                  ? Colors.transparent
                  : const Color(0xff0088E0),
              maxRadius: 50,
              child: BlocBuilder<MapBloc, MapState>(
                builder: (context, stateMap) {

                   if( stateDrawer.isTab == 1) {

                    return IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {
                        // mapBloc.add(OnCloseInfoMarkerBarberEvent());
                        mapDrawer.add(OnMapTabEvent());
                      });
                    
                  }  else if( stateDrawer.isTab == -1  ) {

                    return IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {
                        // mapBloc.add(OnCloseInfoMarkerBarberEvent());
                        mapDrawer.add(OnMapTabEvent());
                      });

                  }

                  else if ( stateMap.infoMarkerBarbe || stateMap.isOpenMenuCircule ) {

                    return IconButton(
                      icon: const Icon(
                        Icons.close_outlined,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {

                          mapBloc.add(OnCloseInfoCircleMenuEvent());
                          infoBarber.add(OnBackInfoBarberEvent());
                          mapBloc.add(OnCloseInfoMarkerBarberEvent());
                          mapBloc.add(OnClearPolylinesEvent());

                      });
                    
                  }else{

                    return IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {
                         mapBloc.add(OnOpenCircleMenuEvent());
                      });


                  } 
                  
                },
              )),
        );
      },
    );
  }
}
