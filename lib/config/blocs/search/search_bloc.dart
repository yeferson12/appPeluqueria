import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:peluquerias/infrastruture/models/models.dart';
import 'package:peluquerias/presentation/services/services.dart';
import 'package:google_polyline_algorithm/google_polyline_algorithm.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {

  WalkingService walkinService;

  SearchBloc({
     required this.walkinService
    }) : super(const SearchState()) {

    on<OnActivateManualMarkerEvent>((event, emit) => emit( state.copyWith( displayManualMarker: true ) ) );
    on<OnDeactivateManualMarkerEvent>((event, emit) => emit( state.copyWith( displayManualMarker: false ) ) );

  }

  Future<RouteDestination> getCoorsStartToEnd( LatLng start, LatLng end) async {

    final walkingResponse =  await walkinService.getCoorsStartToEnd(start, end);

    final geometry =  walkingResponse.routes[0].geometry;
    final distance =  walkingResponse.routes[0].distance;
    final duration =  walkingResponse.routes[0].duration;

    final polyline = decodePolyline( geometry, accuracyExponent: 6 );

    final latlngList = polyline.map(( coor ) => LatLng( coor[0].toDouble(), coor[1].toDouble())).toList();

    return RouteDestination(
      points: latlngList,
      distance: distance,
      duration: duration,
    );

  }
}
