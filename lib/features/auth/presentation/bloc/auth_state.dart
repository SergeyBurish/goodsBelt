part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoggedOutState extends AuthState {}

class LoggedInState extends AuthState {}
