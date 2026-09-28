part of 'authorization_bloc.dart';


class AuthorizationState extends Equatable {
  final String email;
  final String password;
  final AuthorizationStatus status;
  final String? errorMessage;

  const AuthorizationState({
    this.email = '',
    this.password = '',
    this.status = AuthorizationStatus.initial,
    this.errorMessage,
  });

  AuthorizationState copyWith({
    String? email,
    String? password,
    AuthorizationStatus? status,
    String? errorMessage,
  }) {
    return AuthorizationState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [email, password, status, errorMessage];
}
