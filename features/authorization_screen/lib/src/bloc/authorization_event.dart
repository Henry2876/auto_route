part of 'authorization_bloc.dart';

abstract class AuthorizationEvent extends Equatable {
  const AuthorizationEvent();

  @override
  List<Object> get props => [];
}

class EmailChangedEvent extends AuthorizationEvent {
  final String email;

  const EmailChangedEvent(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChangedEvent extends AuthorizationEvent {
  final String password;

  const PasswordChangedEvent(this.password);

  @override
  List<Object> get props => [password];
}

class LoginSubmittedEvent extends AuthorizationEvent {
  const LoginSubmittedEvent();

  @override
  List<Object> get props => [];
}

class GoHomeScreenEvent extends AuthorizationEvent {
  @override
  List<Object> get props => [];
}