import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

part 'authorization_state.dart';

part 'authorization_event.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  AuthorizationBloc() : super(const AuthorizationState()) {
    on<EmailChanged>((event, emit) {
      emit(state.copyWith(email: event.email));
    });
    on<PasswordChanged>((event, emit) {
      emit(state.copyWith(password: event.password));
    });
    on<LoginSubmitted>((event, emit) async {
      emit(state.copyWith(status: AuthorizationStatus.loading));
      try {
        await Future.delayed(const Duration(seconds: 2));
        if (state.email == 'test@test.com' && state.password == '12345') {
          emit(state.copyWith(status: AuthorizationStatus.success));
        } else {
          emit(
            state.copyWith(
              status: AuthorizationStatus.error,
              errorMassage: 'Неверный email или password ',
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            status: AuthorizationStatus.error,
            errorMassage: 'Произошла ошибка. Попробуйте позже.',
          ),
        );
      }
    });
  }
}
