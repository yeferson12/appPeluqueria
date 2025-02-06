import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../config/theme/themes.dart';
import '../../widgets/widgets.dart';


class TabPerfilView extends StatelessWidget {
  const TabPerfilView({super.key});

  Widget build(BuildContext context) {
    final List<String> tuLista = [
      'Nombre',
      'Edad',
      'Sexo',
      'Correo',
      'Teléfono',
      'Dirección',
    ];
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.85,
      child: Column(
        children: [
          // if (index == 0)
          SizedBox(height: size.height * 0.03),
          _IconConfiguration(size: size),
          Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: tuLista.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                        _BoxInfoDrawer(tuLista: tuLista, index: index)
                    ],
                  );
                },
              ),
          ),
          SizedBox(height: size.height * 0.03),
           Container(
            alignment: Alignment.centerRight,
             child: BtnTrasparantWidget(
                      title: "Guardar",
                      color: Colors.black,
                      height: 65, 
                      width: size.width * 0.55,
                    ),
           ),
        ],
      ),
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
      duration: const Duration(milliseconds: 600),
      child: const Row(
        children: [
          Spacer(flex: 1),

          Expanded(
            flex: 1,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min, // Centra los elementos verticalmente
                crossAxisAlignment: CrossAxisAlignment.center, // Centra horizontalmente
                children: [
                  Icon(
                    Icons.person_pin_circle,
                    size: 140,
                    color: colorBlack,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Mis Datos",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: colorBlack,
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
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
    final controller = TextEditingController(); // Controlador para el input

    return FlipInX(
      delay: const Duration(milliseconds: 500),
      duration: const Duration(milliseconds: 600),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          width: size.width * 0.55,
          margin: const EdgeInsets.only(bottom: 25),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: colorBlack,
              width: 1,
            ),
            boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: colorBlack,
                    blurRadius: 6,
                    spreadRadius: -1,
                    blurStyle: BlurStyle.outer)
              ],
          ),
          child: CustomInputFieldWidget(
            hintText: tuLista[index].toLowerCase(),
            controller: controller,
            isRequired: true,
          ),
        ),
      ),
    );
  }
}
