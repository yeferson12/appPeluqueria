import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class LineasCountThreeWidget extends StatelessWidget {
  final double width;
  final double height;
  final bool rightOrLeft;

  const LineasCountThreeWidget({
    super.key, 
    this.width = 50,
    this.height = 40,
    this.rightOrLeft = true,
  });
  @override
  Widget build(BuildContext context) {
    const int delay = 500;
    return Row(
       mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SlideInRight(
          delay: const Duration(milliseconds: delay),
          duration: const Duration(milliseconds:  600),
          child: Container(
            width: width,
            height: 2,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              boxShadow: const <BoxShadow>[
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 10,
                  spreadRadius: -2,
                )
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment:
              (rightOrLeft) ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            //*horizonatal
            SlideInRight(
              delay: const Duration(milliseconds: delay),
              duration: const Duration(milliseconds: 500),
              child: Container(
                width: width,
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 10,
                      spreadRadius: -2,
                    )
                  ],
                ),
              ),
            ),
            //*vertical
            SlideInRight(
              delay: const Duration(milliseconds: delay),//1500
              duration: const Duration(milliseconds: 300 ),
              child: Container(
                width: 2,
                height: height,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  boxShadow: const <BoxShadow>[
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 10,
                      spreadRadius: -2,
                    )
                  ],
                ),
              ),
            ),
            
          ],
        ),
        
      ],
    );
  }
}
