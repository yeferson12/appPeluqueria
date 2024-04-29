import 'package:flutter/material.dart';

class CircleRedGreenWidget extends StatelessWidget {
  final bool isActivite;
  const CircleRedGreenWidget({super.key, required this.isActivite});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
                    width: size.height * 0.02,
                    height: size.height * 0.02,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isActivite ? const Color.fromARGB(255, 1, 155, 24) : const Color.fromARGB(255, 173, 3, 3),
                    ),
                  );
  }
}