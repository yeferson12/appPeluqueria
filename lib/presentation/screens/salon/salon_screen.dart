import 'package:flutter/material.dart';

class SalonScreen extends StatelessWidget {
  static const name = 'salon-screen';

  const SalonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Stack(
        children: [
           const PhotoHomeHeader(),
          Column(
            children: [
              _boxInfo(),
              // Expanded(child: _progressIndicatorsSection(context)), // Ocupa todo el espacio restante
            ],
          ),
        ],
      ),
    );
  }

  SizedBox _boxInfo() {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: 4, // Número de tarjetas
        itemBuilder: (context, index) {
          return _buildCategoryCard(
            title: index == 0 ? "Photos" : "Media",
            itemCount: index == 0 ? 682 : 78,
            isPrivate: index == 0,
            color: Colors.blueGrey,
            icon: index == 0 ? Icons.image : Icons.video_library,
          );
        },
      ),
    );
  }

  Widget _progressIndicatorsSection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _progressIndicatorCard(
          progress: 0.25,
          label: "Fermentum",
          value: "+5,290",
          isPositive: true,
        ),
        _progressIndicatorCard(
          progress: 0.75,
          label: "Fermentum",
          value: "-1,380",
          isPositive: false,
        ),
      ],
    );
  }

  // Cada indicador dentro de su propio Card, ahora más grande
  Widget _progressIndicatorCard({
    required double progress,
    required String label,
    required String value,
    required bool isPositive,
  }) {
    return Expanded(
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.blueGrey[900], // Color de fondo
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Indicador de progreso circular grande
              SizedBox(
                width: 120,
                height: 120,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: progress,
                      strokeWidth: 10,
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation(
                        isPositive ? Colors.purple : Colors.red,
                      ),
                    ),
                    Center(
                      child: Text(
                        "${(progress * 100).toInt()}%",
                        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20), // Espacio entre el indicador y el texto

              // Texto a la derecha del indicador
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    "\$ $value",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: isPositive ? Colors.green : Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  // Widget para las tarjetas
  Widget _buildCategoryCard({
    required String title,
    required int itemCount,
    required bool isPrivate,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.green, size: 28),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text("$itemCount items", style: TextStyle(fontSize: 12, color: Colors.grey[700])),
          const Spacer(),
          Row(
            children: [
              Icon(
                isPrivate ? Icons.lock : Icons.public,
                color: isPrivate ? Colors.blue : Colors.orange,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text(
                isPrivate ? "Private Folder" : "Public Folder",
                style: TextStyle(fontSize: 12, color: Colors.grey[800]),
              ),
            ],
          ),
        ],
      ),
    );
  }



// Header con la imagen
class PhotoHomeHeader extends StatelessWidget {
  const PhotoHomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: PhotoHomeClipper(),
      child: Container(
        height: MediaQuery.of(context).size.height / 2.5,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/img/30221.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.5),
                Colors.black.withOpacity(0.8),
              ],
              stops: const [0.0, 0.6, 1.0],
            ),
          ),
        ),
      ),
    );
  }
}

// ClipPath para el header
class PhotoHomeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.65);
    path.quadraticBezierTo(size.width * 0.5, size.width,
        size.width, size.height * 0.65);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
