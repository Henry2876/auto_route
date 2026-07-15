import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<LoadHomeData>((event, emit) async {
      emit(state.copyWith(status: HomeStatus.loading));

      try {
        await Future.delayed(const Duration(seconds: 1));

        emit(state.copyWith(
          status: HomeStatus.success,
          errorMessage: null,
        ));
      } catch (e) {
        emit(state.copyWith(
          status: HomeStatus.error,
          errorMessage: 'Ошибка загрузки',
        ));
      }
    });


    on<RefreshHomeData>((event, emit) {
      add(const LoadHomeData());
    });

    on<ChangeTab>((event, emit) {
      emit(state.copyWith(selectedTabIndex: event.index));
    });

    on<MenuPressed>((event, emit) {

    });

    on<SettingsPressed>((event, emit) {

    });

    on<LogoPressed>((event, emit) {

    });
  }
}