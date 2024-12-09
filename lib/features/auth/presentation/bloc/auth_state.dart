part of 'auth_bloc.dart';

sealed class AuthState {
  ProfileEntity profile = ProfileEntity.empty();
}

final class AuthInitial extends AuthState {}

class LoggedOutState extends AuthState {}

class LoggedInState extends AuthState {}

final class ProfileState extends AuthState {
  final ProfileEntity _profile;

  ProfileState({required ProfileEntity profile}) : _profile = profile;

  @override
  ProfileEntity get profile => _profile;
}
