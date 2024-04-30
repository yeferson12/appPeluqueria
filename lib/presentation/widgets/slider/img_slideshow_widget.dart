
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../infrastruture/models/models.dart';


class ImgSlideShow extends StatelessWidget {
  final List<ImgsBarber> imgBarber;
  const ImgSlideShow({
    super.key,
    required this.imgBarber
    });


  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        loop: false,
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: false,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary
          )
        ),
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

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 10,
              offset: Offset(0,10)
            )
          ]
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(imgBarber.imgBarber, fit: BoxFit.cover,)
          // CachedNetworkImage(
          //   imageUrl: imgBarber.imgBarber,
          //   fit: BoxFit.cover,
          //   placeholder: (context, url) => const CircularProgressIndicator(),
          //   errorWidget: (context, url, error) => const Icon(Icons.error),
          // )
          ),
      ),
      );
  }
}