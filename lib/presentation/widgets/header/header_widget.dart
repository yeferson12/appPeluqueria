
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class HeaderWaveGradient extends StatelessWidget {

  final bool heightPercentage;

  const HeaderWaveGradient({
    super.key, 
    required this.heightPercentage
  });

  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: heightPercentage ?  size.height * 0.3 : size.height * 0.15,
      width: size.width,
      child:heightPercentage 
      ? SlideInDown(
        child: CustomPaint(
          painter:   
          _HeaderWaveGradientPainterFinal(),
        ),
      )
      :  CustomPaint(
          painter:   
          _HeaderWaveGradientPainterInitial(),
      ),
    );
  }
}

class _HeaderWaveGradientPainterInitial extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    
    final Rect rect = Rect.fromCircle(
      center: const Offset(0.0, 55.0),
      radius: 180
    );

    const Gradient gradiente =  LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color.fromARGB(255, 32, 32, 32),
        Color.fromARGB(255, 32, 32, 32),
        Color.fromARGB(255, 32, 32, 32),
      ],
      stops: [
        0.2,
        0.5,
        1.0,
      ]
    );


    final lapiz =  Paint()..shader = gradiente.createShader(rect);

    // Propiedades
    // lapiz.color = Color(0xff615AAB);
    // lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 10;

    final path =  Path();


///corte de pelo star
    path.lineTo(0, size.height);
    path.quadraticBezierTo(0, size.height * 0.85, size.width * 0.05, size.height * 0.65);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.9, size.width * 0.1, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.2, size.height * 0.6, size.width * 0.15, size.height * 0.1);
    path.quadraticBezierTo(size.width * 0.2, 0, size.width * 0.4, size.height * 0.1);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.9, size.width * 0.6, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.7, size.height * 0.6, size.width * 0.65, size.height * 0.1);

    path.quadraticBezierTo(size.width * 0.8, 0, size.width * 0.85, size.height * 0.1);
    path.quadraticBezierTo(size.width * 0.82, size.height * 0.6, size.width * 0.9, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.9, size.height * 0.85, size.width * 0.95, size.height * 0.6);
    path.quadraticBezierTo(size.width, size.height * 0.85, size.width, size.height);
    path.lineTo( size.width, 0  );

    canvas.drawPath(path, lapiz );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  }

  class _HeaderWaveGradientPainterFinal extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    
    final Rect rect = Rect.fromCircle(
      center: const Offset(0.0, 55.0),
      radius: 180
    );

    const Gradient gradiente =  LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color.fromARGB(255, 32, 32, 32),
        Color.fromARGB(255, 32, 32, 32),
        Color.fromARGB(255, 32, 32, 32),
      ],
      stops: [
        0.2,
        0.5,
        1.0,
      ]
    );


    final lapiz =  Paint()..shader = gradiente.createShader(rect);

    // Propiedades
    // lapiz.color = Color(0xff615AAB);
    // lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 10;

    final path =  Path();

    path.lineTo(0, size.height * 1.2);
path.quadraticBezierTo(0, size.height * 1.05, size.width * 0.05, size.height * 0.85);
path.quadraticBezierTo(size.width * 0.1, size.height * 1.1, size.width * 0.1, size.height * 0.8);
path.quadraticBezierTo(size.width * 0.2, size.height * 0.9, size.width * 0.15, size.height * 0.6);
path.quadraticBezierTo(size.width * 0.2, size.height * 0.5, size.width * 0.4, size.height * 0.6);
path.quadraticBezierTo(size.width * 0.5, size.height * 1.1, size.width * 0.6, size.height * 0.6);

path.quadraticBezierTo(size.width * 0.7, size.height * 0.9, size.width * 0.65, size.height * 0.6);

path.quadraticBezierTo(size.width * 0.8, size.height * 0.5, size.width * 0.85, size.height * 0.6);
path.quadraticBezierTo(size.width * 0.82, size.height * 0.8, size.width * 0.9, size.height * 0.6);
path.quadraticBezierTo(size.width * 0.9, size.height * 1.05, size.width * 0.95, size.height * 0.7);
path.quadraticBezierTo(size.width, size.height * 0.85, size.width, size.height * 1.2);
path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  }

  class _HeaderOndasGradientPainter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    
    final Rect rect = Rect.fromCircle(
      center: const Offset(0.0, 55.0),
      radius: 180
    );

    const Gradient gradiente =  LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color.fromARGB(255, 113, 1, 158),
        Color.fromARGB(255, 113, 1, 158),
        Color.fromARGB(255, 113, 1, 158),
      ],
      stops: [
        0.2,
        0.5,
        1.0,
      ]
    );


    final lapiz =  Paint()..shader = gradiente.createShader(rect);

    // Propiedades
    // lapiz.color = Color(0xff615AAB);
    // lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 10;

    final path =  Path();

// dibujo de olas
    path.lineTo( 0, size.height * 0.7  );
    path.quadraticBezierTo(size.width * 0.25, size.height* 0.9 , size.width * 0.5, size.height * 0.5 );
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.25, size.width, size.height * 0.8 );
    path.lineTo( size.width, 0 );

    canvas.drawPath(path, lapiz );
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  }

  class _HeaderCornerTipsGradientPainter extends CustomPainter {
  
  @override
  void paint(Canvas canvas, Size size) {
    
    final Rect rect = Rect.fromCircle(
      center: const Offset(0.0, 55.0),
      radius: 180
    );

    const Gradient gradiente =  LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color.fromARGB(255, 113, 1, 158),
        Color.fromARGB(255, 113, 1, 158),
        Color.fromARGB(255, 113, 1, 158),
      ],
      stops: [
        0.2,
        0.5,
        1.0,
      ]
    );


    final lapiz =  Paint()..shader = gradiente.createShader(rect);

    // Propiedades
    // lapiz.color = Color(0xff615AAB);
    // lapiz.color = Colors.red;
    lapiz.style = PaintingStyle.fill; // .fill .stroke
    lapiz.strokeWidth = 10;

    final path =  Path();

///punto en la esquina
    path.lineTo(0, size.height);
    path.quadraticBezierTo(0, size.height * 0.85, size.width * 0.05, size.height * 0.65);

    path.quadraticBezierTo(size.width * 0.2, size.height * 0.7, size.width * 0.17, size.height * 0.13);
    path.quadraticBezierTo(size.width * 0.15, size.height * 0.2, size.width * 0.18, size.height * 0.1);
    path.quadraticBezierTo(size.width * 0.4, size.height * 0.2, size.width * 0.5, size.height * 0.1);

    path.quadraticBezierTo(size.width * 0.8, 0, size.width * 0.85, size.height * 0.1);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.7, size.width * 0.95, size.height * 0.7);
    path.quadraticBezierTo(size.width, size.height * 0.85, size.width, size.height);
    path.lineTo( size.width, 0  );

    canvas.drawPath(path, lapiz );
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  }