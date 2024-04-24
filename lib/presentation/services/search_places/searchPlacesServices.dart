import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:peluquerias/infrastruture/models/models.dart';

import '../services.dart';



class SearchPlacesService {

  final Dio _dioPlaces;

  final String _basePlacesUrl  = 'https://api.mapbox.com/search/geocode/v6';

  SearchPlacesService()
    :  _dioPlaces = Dio()..interceptors.add( PlacesInterceptor() );


  Future<List<Feature>> getResultsByQuery( LatLng proximity, String query ) async {

    if ( query.isEmpty ) return [];

    final url = '$_basePlacesUrl/forward';

    final resp = await _dioPlaces.get(url, queryParameters: {
      'q': query,
      'limit': 7,
      'proximity': '${ proximity.longitude },${ proximity.latitude }'
    });

    final placesResponse = PlacesResponse.fromJson( resp.data );

    return placesResponse.features;
  }

   Future<FeatureEnd>getInformationByCoors( LatLng coors ) async {

    final url = '$_basePlacesUrl/reverse';
    final resp = await _dioPlaces.get(url, queryParameters: {
      'latitude': coors.latitude,
      'longitude': coors.longitude,
      'limit': 1,
    });

    final placesResponse = PlacesEndResponse.fromJson( resp.data );


    return placesResponse.features[0];

  }

}