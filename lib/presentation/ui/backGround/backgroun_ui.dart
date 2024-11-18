import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/blocs/blocs.dart';
import '../../../config/theme/themes.dart';
import '../../views/views.dart';
import '../../widgets/widgets.dart';

class BackGroud extends StatelessWidget {
  const BackGroud({super.key});

  @override
  Widget build(BuildContext context) {
    final mapDrawer = BlocProvider.of<DrawerBloc>(context);

    return Positioned.fill(
      child: Scaffold(
        body: BlocBuilder<DrawerBloc, DrawerState>(
          builder: (context, state) {
            return Stack(
                  children: [
        
                    bagraunColor,
        
                     if(state.isTab == 1)
                      const TabConfigurationView(),

                     if(state.isTab == -1)  const TabPerfilView(),
        
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: BottonNavigatorBarWidget(
                        icons: const [Icons.settings,Icons.person_pin_circle_outlined],
                        labels: const ['',''],
                        onTap: (index) {
                          switch (index) {
                            case 0:
                              mapDrawer.add(OnPerfilTabEvent());
                              break;
                            case 1:
                              mapDrawer.add(OnConfigurationTabEvent());
                              break;
        
                            default:
                          }
                        },
                      ),
                    )
                   ]); // Índice actualmente seleccionado);
          }
        )
        ),
        // bottomNavigationBar: const _BottonNavigatorBar(),
      );
  }
}






