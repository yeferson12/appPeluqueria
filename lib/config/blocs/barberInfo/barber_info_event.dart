part of 'barber_info_bloc.dart';

sealed class BarberInfoEvent extends Equatable {
  const BarberInfoEvent();

  @override
  List<Object> get props => [];
}

class OnInfoBarberEvent extends BarberInfoEvent {}
class OnBackInfoBarberEvent extends BarberInfoEvent {}

class OnGetInfoBarberEvent extends BarberInfoEvent {
  final BarberResponse selectedBarber;
  const OnGetInfoBarberEvent(this.selectedBarber);
}
