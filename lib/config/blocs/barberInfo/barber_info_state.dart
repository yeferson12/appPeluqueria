part of 'barber_info_bloc.dart';

 class BarberInfoState extends Equatable {
  final bool infoBarber;

  const BarberInfoState({
    this.infoBarber = false
    }
    );

    BarberInfoState copyWith({
    bool? infoBarber,
  }) 
  => BarberInfoState(
    infoBarber: infoBarber ?? this.infoBarber,
  );
  
  @override
  List<Object> get props => [infoBarber];
}

