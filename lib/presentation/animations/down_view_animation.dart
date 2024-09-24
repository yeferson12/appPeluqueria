import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class DownViewAnimation {
  final AnimationController painterController;
  late final Animation<double> positionAnimation;

  DownViewAnimation(TickerProvider vsync)
      : painterController = AnimationController(
          duration: const Duration(milliseconds: 3000),
          vsync: vsync,
        ) {
    positionAnimation = Tween<double>(
      begin: 1.0,
      end: 0.26,
    ).animate(
      CurvedAnimation(
        parent: painterController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void start() => painterController.forward();

  void dispose() => painterController.dispose();
}
