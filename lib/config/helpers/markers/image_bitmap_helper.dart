import 'dart:ui' as ui;

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show BitmapDescriptor;

import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<BitmapDescriptor> getAssetImageMarker({
    String img = 'assets/barber1.png',
    double size = 9
  }) async {

  return BitmapDescriptor.fromAssetImage(
     ImageConfiguration(
      size: Size(size, size)
    ), 
    img
  );

}

Future<BitmapDescriptor> getNetworkImageMarker() async {

  final resp = await Dio()
    .get(
      'https://cdn4.iconfinder.com/data/icons/small-n-flat/24/map-marker-512.png',
      options: Options( responseType: ResponseType.bytes )
    );

    // return BitmapDescriptor.fromBytes(resp.data);

    // Resize
    final imageCodec = await ui.instantiateImageCodec( resp.data, targetHeight: 150, targetWidth: 150 );
    final frame = await imageCodec.getNextFrame();
    final data = await frame.image.toByteData( format: ui.ImageByteFormat.png );

    if ( data == null ) {
      return await getAssetImageMarker( img: 'assets/barber1.png', size: 50 );
    }

    return BitmapDescriptor.fromBytes( data.buffer.asUint8List() );
}

Future<BitmapDescriptor> getMarkerPainterBitmap( CustomPainter marker ) async {

  final recoder = ui.PictureRecorder();
  final canvas = ui.Canvas( recoder );
  const size = ui.Size(350, 150);

  final startMarker = marker;
  startMarker.paint(canvas, size);

  final picture = recoder.endRecording();
  final image = await picture.toImage(size.width.toInt(), size.height.toInt());
  final byteData = await image.toByteData( format: ui.ImageByteFormat.png );

  return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());

}