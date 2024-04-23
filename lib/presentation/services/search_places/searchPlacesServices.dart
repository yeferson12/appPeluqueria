import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:peluquerias/infrastruture/models/models.dart';

import '../services.dart';



class SearchPlacesService {

  final Dio _dioPlaces;

  final String _basePlacesUrl  = 'https://api.mapbox.com/search/geocode/v6/forward';

  SearchPlacesService()
    :  _dioPlaces = Dio()..interceptors.add( PlacesInterceptor() );


  Future<List<Feature>> getResultsByQuery( LatLng proximity, String query ) async {

    if ( query.isEmpty ) return [];

    final url = _basePlacesUrl;

    final resp = await _dioPlaces.get(url, queryParameters: {
      'q': query,
      'proximity': '${ proximity.longitude },${ proximity.latitude }'
    });

    final placesResponse = PlacesResponse.fromJson( resp.data );

    return placesResponse.features;
  }

}