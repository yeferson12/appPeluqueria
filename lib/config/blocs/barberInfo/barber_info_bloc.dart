import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'barber_info_event.dart';
part 'barber_info_state.dart';

class BarberInfoBloc extends Bloc<BarberInfoEvent, BarberInfoState> {
  BarberInfoBloc() : super(const BarberInfoState()) {
    on<OnInfoBarberEvent>((event, emit) => emit( state.copyWith( infoBarber: true ) ));
    on<OnBackInfoBarberEvent>((event, emit) => emit( state.copyWith( infoBarber: false ) ));
  }

}
