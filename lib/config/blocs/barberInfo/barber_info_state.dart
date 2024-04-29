part of 'barber_info_bloc.dart';

 class BarberInfoState extends Equatable {
  final bool infoBarber;
  final List<ReviewsModal> reviews;

  const BarberInfoState({
    this.infoBarber = false,
    List< ReviewsModal >? reviews
    }
    ):reviews = reviews ?? const [];

    BarberInfoState copyWith({
    bool? infoBarber,
    List< ReviewsModal >? reviews
  }) 
  => BarberInfoState(
    infoBarber: infoBarber ?? this.infoBarber,
    reviews: reviews ?? this.reviews,
  );
  
  @override
  List<Object> get props => [infoBarber, reviews];
}

