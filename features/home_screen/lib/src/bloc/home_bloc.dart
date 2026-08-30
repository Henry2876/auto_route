import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:core/core.dart';
import 'package:navigation/navigation.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final AppRouter _appRouter;

  HomeBloc({required AppRouter appRouter})
    : _appRouter = appRouter,
      super(const HomeState()) {
    on<LoadHomeDataEvent>(_loadHomeData);
    on<RefreshHomeDataEvent>(_refreshHomeData);
    on<ChangeTabEvent>(_changeTab);
    on<MenuPressedEvent>(_menuPressed);
    on<SettingsPressedEvent>(_settingsPressed);
    on<LogoPressedEvent>(_logoPressed);
    on<BackAuthorizationScreenEvent>(_backAuthorization);
  }

  Future<void> _loadHomeData(
    LoadHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading));
    try {
      emit(state.copyWith(status: HomeStatus.success, errorMessage: null));
    } catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.error,
          errorMessage: LocaleKeys.mainPage_homeScreen_loadingError.tr(),
        ),
      );
    }
  }

  Future<void> _refreshHomeData(
    RefreshHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    add(const LoadHomeDataEvent());
  }

  Future<void> _changeTab(ChangeTabEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(selectedTabIndex: event.index));
  }

  Future<void> _menuPressed(
    MenuPressedEvent event,
    Emitter<HomeState> emit,
  ) async {}

  Future<void> _settingsPressed(
    SettingsPressedEvent event,
    Emitter<HomeState> emit,
  ) async {}

  Future<void> _logoPressed(
    LogoPressedEvent event,
    Emitter<HomeState> emit,
  ) async {}

  Future<void> _backAuthorization(
    BackAuthorizationScreenEvent event,
    Emitter<HomeState> emit,
  ) async {
    await _appRouter.push(AuthorizationRoute());
  }
}
