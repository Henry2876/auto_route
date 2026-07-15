part of 'authorization_bloc.dart';


enum AuthorizationStatus { initial, loading, success, error }

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
    String? errorMassage,
  }) {
    return AuthorizationState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      errorMessage: errorMassage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [email, password, status, errorMessage];
}