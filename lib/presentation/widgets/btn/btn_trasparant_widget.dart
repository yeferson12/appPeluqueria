import 'package:flutter/material.dart';

class BtnTrasparantWidget extends StatelessWidget {
  final String title;
  final Color color;
  final Function()? onPress;
  final double? height; // Nuevo parámetro para la altura
  final double? width;  // Nuevo parámetro para el ancho

  const BtnTrasparantWidget({
    super.key,
    required this.title,
    this.color = Colors.blue,
    this.onPress,
    this.height, // Parámetro opcional
    this.width,  // Parámetro opcional
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: height ?? 50, // Altura predeterminada de 50
        width: width ?? 150,  // Ancho predeterminado de 150
        alignment: Alignment.center, // Centrar el texto
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: color),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
