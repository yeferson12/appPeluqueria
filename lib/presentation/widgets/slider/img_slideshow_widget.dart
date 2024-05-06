
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../infrastruture/models/models.dart';


class ImgSlideShow extends StatelessWidget {
  final List<ImgsBarber> imgBarber;
  const ImgSlideShow({
    super.key,
    required this.imgBarber
    });


  @override
  Widget build(BuildContext context) {

    // final colors = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(left: 20),
      height: 210,
      width: double.infinity,
      child: Swiper(
        loop: false,
        index: imgBarber.length - 1,
        viewportFraction: 0.8,
        scale: 0.9,
        layout: SwiperLayout.STACK,
        autoplay: false,
        itemWidth: size.width * 0.7,
        itemHeight: size.height * 0.19,
        itemCount: imgBarber.length,
        itemBuilder: (context, index) {
           return _Slide(imgBarber: imgBarber[index]);
        }
         ),
    );
  }
}

class _Slide extends StatelessWidget {
  final ImgsBarber imgBarber;

  const _Slide({ required this.imgBarber });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // if( imgBarber.imgBarber.isEmpty) {
    //   return SizedBox(
    //     width: double.infinity,
    //     height: size.height * 0.5,
    //     child: const Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    // }

    return Padding(
  padding: const EdgeInsets.only(bottom: 1),
  child: DecoratedBox(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.white,
          blurRadius: 3,
        ),
      ],
    ),
    child: Row(
          children: [
            SizedBox(
              width: size.width * 0.26, 
              child: SvgPicture.asset(
                  imgBarber.imgBarber,
                  width: size.width * 0.2,
                  height: size.height * 0.15,
                ),
            ),
             Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Yeferson monsalve',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: size.height * 0.015,),
                    const Text(
                      'Edad: 30 años',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      'Turnos: 5',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const Text(
                      'Disponible: De L a V',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    GestureDetector(
              onTap: () {
                // Acción al presionar el icono
              },
              child: Image.asset(
                'assets/cuchilla_b.png',
                width: size.width * 0.2,
                height: size.height * 0.07,
                fit: BoxFit.cover,
              ),
            ),
                  ],
                ),
              ),
            ),
            
          ],
        ),
  ),
);

  }
}