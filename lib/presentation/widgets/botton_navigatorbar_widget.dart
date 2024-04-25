import 'package:flutter/material.dart';

class BottonNavigatorBarWidget extends StatelessWidget {
  final List<IconData> icons;
  final List<String> labels;
  final ValueChanged<int> onTap;
  final int currentIndex;

  const BottonNavigatorBarWidget({
    Key? key,
    required this.icons,
    required this.labels,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(0, 114, 1, 158),
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(icons.length, (index) {
          return GestureDetector(
            onTap: () => onTap(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icons[index],
                  size: 30.0,
                  color: index == currentIndex ? Colors.white : Colors.grey,
                ),
                SizedBox(height: 4.0),
                Text(
                  labels[index],
                  style: TextStyle(
                    color: index == currentIndex ? Colors.white : Colors.grey,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}