import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/blocs/blocs.dart';
import '../../widgets/widgets.dart';

class BackGroud extends StatelessWidget {
  const BackGroud({super.key});

  @override
  Widget build(BuildContext context) {
    final mapDrawer = BlocProvider.of<DrawerBloc>(context);

    return Positioned.fill(
      child: Scaffold(
        body: Stack(
          children: [

            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromARGB(255, 84, 55, 107),
                    Color.fromARGB(255, 61, 0, 108),
                    Color.fromARGB(255, 113, 1, 158),
                  ])),
            ),

            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: BottonNavigatorBarWidget(
                icons: const [Icons.calendar_today,Icons.add,Icons.bubble_chart],
                labels: const ['','',''],
                onTap: (index) {
                  switch (index) {
                    case 0:
                      mapDrawer.add(OnPerfilTabEvent());
                      break;
                    case 1:
                      mapDrawer.add(OnMapTabEvent());
                      break;
                    case 2:
                      mapDrawer.add(OnConfigurationTabEvent());
                      break;

                    default:
                  }
                },
                currentIndex: 0,
              ),
            ) // Índice actualmente seleccionado)
          ],
        ),
        // bottomNavigationBar: const _BottonNavigatorBar(),
      ),
    );
  }
}


