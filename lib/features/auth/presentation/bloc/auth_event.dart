part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginPressedEvent extends AuthEvent {
  final String email;
  final String password;

  LoginPressedEvent({required this.email, required this.password});
}
