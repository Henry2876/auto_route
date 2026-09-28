part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class LoadHomeDataEvent extends HomeEvent {
  const LoadHomeDataEvent();
}

class RefreshHomeDataEvent extends HomeEvent {
  const RefreshHomeDataEvent();
}

class ChangeTabEvent extends HomeEvent {
  final int index;

  const ChangeTabEvent(this.index);

  @override
  List<Object> get props => [index];
}

class MenuPressedEvent extends HomeEvent {
  const MenuPressedEvent();
}

class SettingsPressedEvent extends HomeEvent {
  const SettingsPressedEvent();
}

class LogoPressedEvent extends HomeEvent {
  const LogoPressedEvent();
}

class BackAuthorizationScreenEvent extends HomeEvent {
  const BackAuthorizationScreenEvent();
}
