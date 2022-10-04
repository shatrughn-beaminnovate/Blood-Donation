part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvent {
  const AppStarted();
}

class LoggedIn extends AuthenticationEvent {
  final LoginData loginData;

  const LoggedIn({required this.loginData});

  @override
  String toString() => 'LoggedIn { token: $loginData }';
}

class LoggedOut extends AuthenticationEvent {
  const LoggedOut();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'LoggedOut';
}
