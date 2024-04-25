import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drawer_event.dart';
part 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(const DrawerState()) {
    on<OnPerfilTabEvent>((event, emit) => emit( state.copyWith( isTab: 1) ));
    on<OnConfigurationTabEvent>((event, emit) => emit( state.copyWith( isTab: -1 ) ));
    on<OnMapTabEvent>((event, emit) => emit( state.copyWith( isTab: 0 ) ));
  }
}
