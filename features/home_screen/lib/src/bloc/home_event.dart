part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class LoadHomeData extends HomeEvent {
  const LoadHomeData();
}

class RefreshHomeData extends HomeEvent {
  const RefreshHomeData();
}

class ChangeTab extends HomeEvent {
  final int index;
  const ChangeTab(this.index);
  @override
  List<Object> get props => [index];
}

class MenuPressed extends HomeEvent {
  const MenuPressed();
}

class SettingsPressed extends HomeEvent {
  const SettingsPressed();
}

class LogoPressed extends HomeEvent {
  const LogoPressed();
}