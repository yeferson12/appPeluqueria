part of 'barber_info_bloc.dart';

 class BarberInfoState extends Equatable {
  final bool infoBarber;
  final List<BarberResponse> infoByBarber;
  final BarberResponse? selectedBarber;

  const BarberInfoState({
    this.infoBarber = false,
    List< BarberResponse >? infoByBarber,
    this.selectedBarber
    }
    ):infoByBarber = infoByBarber ?? const [];

    BarberInfoState copyWith({
    bool? infoBarber,
    List< BarberResponse >? infoByBarber,
    BarberResponse? selectedBarber,
  }) 
  => BarberInfoState(
    infoBarber: infoBarber ?? this.infoBarber,
    infoByBarber: infoByBarber ?? this.infoByBarber,
    selectedBarber: selectedBarber ?? this.selectedBarber,
  );
  
  @override
  List<Object> get props => [infoBarber, infoByBarber, selectedBarber ?? BarberResponse(id: 0, img: '',name: '',location: LatLng(40.43455, -34.345345))];
}

