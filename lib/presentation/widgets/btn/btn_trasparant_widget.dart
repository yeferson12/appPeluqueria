
import 'package:flutter/material.dart';

class BtnTrasparantWidget extends StatelessWidget {
  final String title;
  final Color color;
  final Function()? onPress;
  
  const BtnTrasparantWidget({
    super.key, 
    required this.title,
    this.color = Colors.blue,
    this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 1, color: color)),
        child: Text(title,
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
