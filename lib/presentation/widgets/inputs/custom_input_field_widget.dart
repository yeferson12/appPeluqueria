import 'package:flutter/material.dart';

class CustomInputFieldWidget extends StatelessWidget {
  final String hintText; // Texto de sugerencia
  final TextInputType keyboardType; // Tipo de teclado (texto, número, etc.)
  final bool isRequired; // Campo obligatorio
  final TextEditingController controller; // Controlador para manejar el texto

  const CustomInputFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            labelText: hintText,
            hintStyle: const TextStyle(color: Colors.black87),
            fillColor: Colors.transparent,
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.black),
          validator: (value) {
            if (isRequired && (value == null || value.isEmpty)) {
              return 'Este campo es obligatorio';
            }
            return null;
          },
        ),
      ],
    );
  }
}
