part of 'drawer_bloc.dart';

class DrawerState extends Equatable {

  final int isTab;

  const DrawerState({
     this.isTab = 0, 
    });
    
    DrawerState copyWith({
    int? isTab,
  }) 
  => DrawerState(
    isTab       : isTab ?? this.isTab,
  );
  @override
  List<Object> get props => [isTab];
}
