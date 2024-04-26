
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class TabConfigurationView extends StatelessWidget {
  const TabConfigurationView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tuLista = [
      'Elemento 1',
      'Elemento 2',
      'Elemento 3',
      'Elemento 4',
    ];
    final size = MediaQuery.of(context).size;
    final List<Widget> listWidget = [
      const LineasCountThreeWidget(),
      const LineasCountTwoWidget(),
      const LineasCountThreeWidget(),
      const LineasCountTwoWidget(),
    ];

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: tuLista.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            if (index == 0)
              _IconConfiguration(size: size),

            _LineAndBox(
                size: size,
                tuLista: tuLista,
                listWidget: listWidget,
                index: index),
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
        alignment: Alignment.centerLeft,
        child: const Icon(Icons.settings_outlined,
            size: 140,
            color: Colors.white,
            shadows: <BoxShadow>[
              BoxShadow(
                  color: Colors.white,
                  blurRadius: 6,
                  spreadRadius: -2,
                  blurStyle: BlurStyle.outer)
            ]),
      ),
    );
  }
}

class _LineAndBox extends StatelessWidget {
  const _LineAndBox(
      {super.key,
      required this.size,
      required this.tuLista,
      required this.listWidget,
      required this.index});

  final Size size;
  final List<String> tuLista;
  final List<Widget> listWidget;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: size.width * 0.6,
          height: size.height * 0.1,
          padding: const EdgeInsets.only(left: 8),
          child: Stack(
            children: [
              Positioned(
                  top: 20,
                  left: 35,
                  child: _BoxInfoDrawer(tuLista: tuLista, index: index)),
              Positioned(
                top: index == 1 || index == 3 ? 2 : 16,
                left: index == 1 || index == 3 ? 88 : 130,
                right: 0,
                child: SizedBox(
                  child: listWidget[index],
                ),
              ),
            ],
          ),
        ),
      ],
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
    return FlipInX(
      delay: const Duration(milliseconds: 500), //1500
      duration: const Duration(milliseconds: 600),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Colors.white,
                    blurRadius: 6,
                    spreadRadius: -2,
                    blurStyle: BlurStyle.outer)
              ],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white,
                width: 1,
              )),
          padding: const EdgeInsets.all(8.0),
          child: Text(
            tuLista[index],
            style: const TextStyle(color: Colors.white),
          )),
    );
  }
}
