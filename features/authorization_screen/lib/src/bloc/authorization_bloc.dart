import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:navigation/navigation.dart';

part 'authorization_state.dart';

part 'authorization_event.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  final AppRouter _appRouter;

  AuthorizationBloc({required AppRouter appRouter})
    : _appRouter = appRouter,
      super(const AuthorizationState()) {
    on<EmailChangedEvent>(_emailChanged);
    on<PasswordChangedEvent>(_passwordChanged);
    on<LoginSubmittedEvent>(_loginSubmitted);
    on<GoHomeScreenEvent>(_goHomeScreen);
  }

  Future<void> _emailChanged(
    EmailChangedEvent event,
    Emitter<AuthorizationState> emit,
  ) async {
    emit(
      state.copyWith(
        email: event.email,
        status: AuthorizationStatus.initial,
        errorMessage: null,
      ),
    );
  }

  Future<void> _passwordChanged(
    PasswordChangedEvent event,
    Emitter<AuthorizationState> emit,
  ) async {
    emit(
      state.copyWith(
        password: event.password,
        status: AuthorizationStatus.initial,
        errorMessage: null,
      ),
    );
  }

  Future<void> _loginSubmitted(
    LoginSubmittedEvent event,
    Emitter<AuthorizationState> emit,
  ) async {
    emit(state.copyWith(status: AuthorizationStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (state.email == 'test' && state.password == 'test') {
        emit(state.copyWith(status: AuthorizationStatus.success));
        add(GoHomeScreenEvent());
      } else {
        emit(
          state.copyWith(
            status: AuthorizationStatus.error,
            errorMessage: LocaleKeys.mainPage_authorizationScreen_invalidCredentials.tr(),
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthorizationStatus.error,
          errorMessage: LocaleKeys.mainPage_authorizationScreen_unknownError.tr(),
        ),
      );
    }
  }

  Future<void> _goHomeScreen(
    GoHomeScreenEvent event,
    Emitter<AuthorizationState> emit,
  ) async {
    await _appRouter.push(HomeRoute());
  }
}
