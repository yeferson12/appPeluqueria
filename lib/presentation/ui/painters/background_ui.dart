import 'package:flutter/material.dart';
import 'package:peluquerias/config/theme/colors_theme.dart';

class Background extends StatelessWidget {
  const Background({super.key});

 @override
Widget build(BuildContext context) {
  return  Scaffold(
    backgroundColor: Colors.transparent,
    body: Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color(0xffE24C3B),
                Color(0xffFBF3EF),
                Color(0xff0088E0),
              ])),
        ),
        // Align(
        //   alignment: Alignment.topCenter,
        //   child: WavyHeaderBorder(),
        // ),
        const Align(
          alignment: Alignment.topCenter,
          child: WavyHeader(),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: WavyFooter(),
        ),
      ],
    ),
  );
}


}

const List<Color> orangeGradients = [
  
  Color(0xffE24C3B),
  Color(0xffE24C3B),
];

const List<Color> orangeGradientsBorder = [
  
  Color.fromARGB(255, 255, 154, 154),
  Color.fromARGB(255, 255, 154, 154),
];


const List<Color> aquaGradients = [
  Color(0xff0088E0),
  Color(0xff0088E0),
];

class WavyHeader extends StatelessWidget {
  const WavyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopWaveClipper(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: orangeGradients,
              begin: Alignment.topLeft,
              end: Alignment.center),
        ),
        height: MediaQuery.of(context).size.height / 2.3,
      ),
    );
  }
}

class WavyHeaderBorder extends StatelessWidget {
  const WavyHeaderBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopWaveClipperBorder(), // Nueva versión más grande
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: orangeGradientsBorder,
              begin: Alignment.topLeft,
              end: Alignment.center),
        ),
        height: MediaQuery.of(context).size.height / 1,
      ),
    );
  }
}


class WavyFooter extends StatelessWidget {
  const WavyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: FooterWaveClipper(),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: aquaGradients,
              begin: Alignment.center,
              end: Alignment.bottomRight),
        ),
        height: MediaQuery.of(context).size.height / 3,
      ),
    );
  }
}



class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // This is where we decide what part of our image is going to be visible.
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = new Offset(size.width / 7, size.height - 30);
    var firstEndPoint = new Offset(size.width / 6, size.height / 1.5);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint =
        Offset(size.width - (size.width / 9), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    ///move from bottom right to top
    path.lineTo(size.width, 0.0);

    ///finally close the path by reaching start point from top right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}



class TopWaveClipperBorder extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = Offset(size.width / 20, size.height - 30);
    var firstEndPoint = Offset(size.width / 9, size.height / 1.5);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 5, size.height / 4);
    var secondEndPoint = Offset(size.width / 1.5, size.height / 5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(size.width - (size.width / 8), size.height / 6);
    var thirdEndPoint = Offset(size.width, 0.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy, thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}



class FooterWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    
    // Comenzamos en la parte superior derecha
    path.moveTo(size.width, 0);

    var firstControlPoint = Offset(size.width - (size.width / 7), 30);
    var firstEndPoint = Offset(size.width - (size.width / 6), size.height / 3);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 5), size.height - (size.height / 4));
    var secondEndPoint = Offset(size.width / 3, size.height - (size.height / 5));

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(size.width / 9, size.height - (size.height / 6));
    var thirdEndPoint = Offset(size.width /9, size.height);

    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


