import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/blocs/blocs.dart';

class BtnFloatWidget extends StatelessWidget {
  const BtnFloatWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mapDrawer = BlocProvider.of<DrawerBloc>(context);
    final mapBloc = BlocProvider.of<MapBloc>(context);

    return BlocBuilder<DrawerBloc, DrawerState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: CircleAvatar(
              backgroundColor: state.isTab != 0
                  ? Colors.transparent
                  : const Color.fromARGB(255, 113, 1, 158),
              maxRadius: 50,
              child: IconButton(
                  icon: Icon(
                    Icons.add,
                    color: state.isTab == 0 ? Colors.white : Colors.grey,
                    size: 30.0,
                  ),
                  onPressed: () {
                    mapBloc.add(OnCloseInfoMarkerBarberEvent());
                    mapDrawer.add(OnMapTabEvent());
                  })),
        );
      },
    );
  }
}
