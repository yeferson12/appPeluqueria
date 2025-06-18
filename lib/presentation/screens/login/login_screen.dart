import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:peluquerias/config/theme/themes.dart';

import '../../ui/painters/background_ui.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const name = 'login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          const Background(),
          // Peine personalizado en vertical y grande
          // Positioned(
          //   top: screenHeight * 0.15,
          //   left: screenWidth * 0.1,
          //   child: CustomPaint(
          //     size: Size(screenWidth* 0.8, screenHeight * 0.6), // Tamaño responsive
          //     painter: _HeaderOndasGradientPainter(),
          //   ),
          // ),
          // Contenido del formulario
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Campo de Usuario
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person, color: Colors.purple.shade700),
                      hintText: 'Usuario o correo',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Campo de Contraseña
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Colors.purple.shade700),
                      hintText: 'Contraseña',
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.9),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Botón de Iniciar Sesión
                  ElevatedButton(
                    onPressed: () { context.go('/home-screen'); },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple.shade700,
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Opciones adicionales
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Registrarse',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// CustomPainter para el peine
class CombPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final path = Path();

    // Dibuja el mango del peine con ondas
    path.moveTo(0, 0); // Punto de inicio en la parte superior del mango

    // Curva hacia afuera en la parte superior del mango
    path.quadraticBezierTo(
      size.width * 0.1, size.height * 0.1, // Control point
      0, size.height * 0.2, // End point de la curva
    );

    // Línea recta hacia la mitad
    // path.lineTo(0, size.height * 0.8);

    // Curva hacia adentro en la parte inferior del mango
    path.quadraticBezierTo(
      -size.width * 0.1, size.height * 0.9, // Control point hacia adentro
      0, size.height, // End point de la curva en la parte inferior
    );

    // // Dibuja los dientes del peine en la parte derecha
    // for (double i = 0; i < size.height; i += 40) {
    //   path.moveTo(0, i);
    //   path.lineTo(size.width * 0.8, i); // Dientes horizontales
    // }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
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
    lapiz.style = PaintingStyle.stroke; // .fill .stroke
    lapiz.strokeWidth = 10;

    final path =  Path();

    path.quadraticBezierTo(-size.width * 0.2, size.height* 0.1 , 0, size.height * 0.6 );
    path.quadraticBezierTo(size.width * 0.12, size.height * 0.8, -size.width * 0.1, size.height * 1.1 );
    path.quadraticBezierTo( size.width * 0.0, size.height * 1.5 , size.width * 0.3, size.height * 1.1,);
    path.quadraticBezierTo( size.width * 0.14, size.height * 0.8 , size.width * 0.3, size.height * 0.8,);
    path.lineTo(size.width, size.height * 0.79); 
    // path.quadraticBezierTo(size.width, size.height * 0.8, size.width * 1, size.height * 0.7);

    final arcRectRight1 = Rect.fromLTWH(size.width * 0.9, size.height * 0.63, 85, 85);
    path.arcTo(arcRectRight1, 3.14 / 2, -3.14, false);
    path.lineTo(size.width * 0.4, size.height * 0.64); 

    final arcRectLeft = Rect.fromLTWH(size.width * 0.3, size.height * 0.483, 85, 85);
    path.arcTo(arcRectLeft, 3.14 / 2, 3.14, false);
    path.lineTo(size.width, size.height * 0.483); 

    final arcRectRight2 = Rect.fromLTWH(size.width * 0.9, size.height * 0.323, 85, 85);
    path.arcTo(arcRectRight2, 3.14 / 2, -3.14, false);
    path.lineTo(size.width * 0.5, size.height * 0.33); 

    final arcRectLeft2 = Rect.fromLTWH(size.width * 0.4, size.height * 0.173, 85, 85);
    path.arcTo(arcRectLeft2, 3.14 / 2, 3.14, false);
    path.lineTo(size.width, size.height * 0.17); 

    final arcRectRight3 = Rect.fromLTWH(size.width * 0.9, size.height * 0.01, 85, 85);
    path.arcTo(arcRectRight3, 3.14 / 2, -3.14, false);
    path.lineTo(size.width * 0.5, 0); 

    // final arcRectLeft3 = Rect.fromLTWH(size.width * 0.4, size.height * 0.207, 85, 85);
    // path.arcTo(arcRectLeft3, 3.14 / 2, 3.14, false);
    // path.lineTo(size.width, size.height * 0.2); 

    // final arcRectRight4 = Rect.fromLTWH(size.width * 0.9, size.height * 0.108, 50, 50);
    // path.arcTo(arcRectRight4, 3.14 / 2, -3.14, false);
    // path.lineTo(size.width * 0.5, size.height * 0.1); 

    // final arcRectLeft4 = Rect.fromLTWH(size.width * 0.4, size.height * 0.007, 50, 50);
    // path.arcTo(arcRectLeft4, 3.14 / 2, 3.14, false);
    // path.lineTo(size.width, size.height * 0.0);
    


    canvas.drawPath(path, lapiz );
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
  }

