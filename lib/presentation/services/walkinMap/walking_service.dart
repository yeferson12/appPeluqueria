

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:peluquerias/infrastruture/models/models.dart';

import '../services.dart';

class WalkingService {

  final Dio _dioWalking;

  final String _baseWalkingUrl = "https://api.mapbox.com/directions/v5/mapbox";

  WalkingService()
    : _dioWalking = Dio()..interceptors.add( WalkingInterceptor() );


  Future<WalkingResponse> getCoorsStartToEnd( LatLng start, LatLng end ) async {


    final coorsString = '${ start.longitude },${ start.latitude };${ end.longitude },${ end.latitude }';
    final url = '$_baseWalkingUrl/walking/$coorsString';

    final resp = await _dioWalking.get(url);

    final data = WalkingResponse.fromJson(resp.data);
    
    return data;

  }
  
}