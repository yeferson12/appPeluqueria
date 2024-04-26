
import 'package:flutter/material.dart';

class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient({super.key});

  
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.15,
      width: size.width,
      child: CustomPaint(
        painter: _HeaderWaveGradientPainter(),
      ),
    );
  }
}

class _HeaderWaveGradientPainter extends CustomPainter {
  
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
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
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


///corte de pelo
    // path.lineTo(0, size.height);
    // path.quadraticBezierTo(0, size.height * 0.85, size.width * 0.05, size.height * 0.65);
    // path.quadraticBezierTo(size.width * 0.1, size.height * 0.9, size.width * 0.1, size.height * 0.3);
    // path.quadraticBezierTo(size.width * 0.2, size.height * 0.6, size.width * 0.15, size.height * 0.1);
    // path.quadraticBezierTo(size.width * 0.2, 0, size.width * 0.4, size.height * 0.1);
    // path.quadraticBezierTo(size.width * 0.5, size.height * 0.9, size.width * 0.6, size.height * 0.3);
    // path.quadraticBezierTo(size.width * 0.7, size.height * 0.6, size.width * 0.65, size.height * 0.1);

    // path.quadraticBezierTo(size.width * 0.8, 0, size.width * 0.85, size.height * 0.1);
    // path.quadraticBezierTo(size.width * 0.82, size.height * 0.6, size.width * 0.9, size.height * 0.3);
    // path.quadraticBezierTo(size.width * 0.9, size.height * 0.85, size.width * 0.95, size.height * 0.6);
    // path.quadraticBezierTo(size.width, size.height * 0.85, size.width, size.height);
    // path.lineTo( size.width, 0  );

// dibujo de olas
    // path.lineTo( 0, size.height * 0.7  );
    // path.quadraticBezierTo(size.width * 0.25, size.height* 0.9 , size.width * 0.5, size.height * 0.5 );
    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.25, size.width, size.height * 0.8 );
    // path.lineTo( size.width, 0 );


    ///punto en la esquina
    // path.lineTo(0, size.height);
    // path.quadraticBezierTo(0, size.height * 0.85, size.width * 0.05, size.height * 0.65);

    // path.quadraticBezierTo(size.width * 0.2, size.height * 0.7, size.width * 0.17, size.height * 0.13);
    // path.quadraticBezierTo(size.width * 0.15, size.height * 0.2, size.width * 0.18, size.height * 0.1);
    // path.quadraticBezierTo(size.width * 0.4, size.height * 0.2, size.width * 0.5, size.height * 0.1);

    // path.quadraticBezierTo(size.width * 0.8, 0, size.width * 0.85, size.height * 0.1);
    // path.quadraticBezierTo(size.width * 0.75, size.height * 0.7, size.width * 0.95, size.height * 0.7);
    // path.quadraticBezierTo(size.width, size.height * 0.85, size.width, size.height);
    // path.lineTo( size.width, 0  );
  


    canvas.drawPath(path, lapiz );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  }