import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/blocs/blocs.dart';

class BottonNavigatorBarWidget extends StatelessWidget {
  final List<IconData> icons;
  final List<String> labels;
  final ValueChanged<int> onTap;

  const BottonNavigatorBarWidget({
    Key? key,
    required this.icons,
    required this.labels,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerBloc, DrawerState>(
      builder: (context, state) {
        return Container(
          color: const Color.fromARGB(0, 114, 1, 158),
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(icons.length, (index) {

              var iconColor = false ;

              if (state.isTab == 1 && index == 0) {
                 iconColor =  true;
              }
              if (state.isTab == -1 && index == 2) {
                 iconColor =  true;
              }
              

              return GestureDetector(
                onTap: () => onTap(index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      icons[index],
                      size: 30.0,
                      color: iconColor ? Colors.white : Colors.grey,
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      labels[index],
                    ),
                  ],
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
