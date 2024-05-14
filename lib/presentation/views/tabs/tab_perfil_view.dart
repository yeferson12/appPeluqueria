import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../config/theme/themes.dart';


class TabPerfilView extends StatelessWidget {
  const TabPerfilView({super.key});

  Widget build(BuildContext context) {
    final List<String> tuLista = [
      'Elemento 1',
      'Elemento 2',
      'Elemento 3',
      'Elemento 4',
      'Elemento 5',
      'Elemento 6',
    ];
    final size = MediaQuery.of(context).size;

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: tuLista.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            if (index == 0)
              _IconConfiguration(size: size),

            
              _BoxInfoDrawer(tuLista: tuLista, index: index)
          ],
        );
      },
    );
  }
}

class _IconConfiguration extends StatelessWidget {
  const _IconConfiguration({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BounceInLeft(
           delay: const Duration(milliseconds: 1000),
          duration: const Duration(milliseconds:  600),
      child: Container(
        margin: const EdgeInsets.only(bottom: 100),
        width: size.width,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.person_pin_circle,
            size: 140,
            color: colorBlack,
            shadows: <BoxShadow>[
              BoxShadow(
                  color: colorBlack,
                  blurRadius: 6,
                  spreadRadius: -2,
                  blurStyle: BlurStyle.outer)
            ]),
      ),
    );
  }
}

class _BoxInfoDrawer extends StatelessWidget {
  const _BoxInfoDrawer({
    super.key,
    required this.tuLista,
    required this.index,
  });

  final List<String> tuLista;
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FlipInX(
      delay: const Duration(milliseconds: 500), //1500
      duration: const Duration(milliseconds: 600),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          alignment: Alignment.center,
          width: size.width * 0.4,
          height: size.height * 0.1,
          margin: const EdgeInsets.only(bottom: 30,left: 40),
            decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: const <BoxShadow>[
                  BoxShadow(
                      color: colorBlack,
                      blurRadius: 6,
                      spreadRadius: -2,
                      blurStyle: BlurStyle.outer)
                ],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: colorBlack,
                  width: 1,
                )),
            padding: const EdgeInsets.all(8.0),
            child: Text(
              tuLista[index],
              style: const TextStyle(color: colorBlack),
            )),
      ),
    );
  }
}