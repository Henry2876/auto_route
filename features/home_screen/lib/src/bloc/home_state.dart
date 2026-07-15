part of 'home_bloc.dart';


enum HomeStatus {
  initial,
  loading,
  success,
  error
}


class HomeState extends Equatable {
  final HomeStatus status;
  final int selectedTabIndex;
  final String? errorMessage;

  const HomeState({
    this.status = HomeStatus.initial,
    this.selectedTabIndex = 0,
    this.errorMessage,
  });


  HomeState copyWith({
    HomeStatus? status,
    int? selectedTabIndex,
    String? errorMessage,
  }) {
    return HomeState(
      status: status ?? this.status,
      selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, selectedTabIndex, errorMessage];
}