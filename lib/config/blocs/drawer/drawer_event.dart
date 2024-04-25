part of 'drawer_bloc.dart';

sealed class DrawerEvent extends Equatable {
  const DrawerEvent();

  @override
  List<Object> get props => [];
}

class OnPerfilTabEvent extends DrawerEvent {}
class OnConfigurationTabEvent extends DrawerEvent {}
class OnMapTabEvent extends DrawerEvent {}
