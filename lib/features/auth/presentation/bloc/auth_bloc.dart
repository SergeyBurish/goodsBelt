import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goods_belt/features/auth/domain/usecase/auth_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SplashScreenInitEvent>((event, emit) async {
      bool success = await AuthUsecase.authManager.refreshTocken();
      if (success) {
        emit(LoggedInState());
      } else {
        emit(LoggedOutState());
      }
    });

    on<LoginPressedEvent>((event, emit) async {
      await AuthUsecase.authManager.login(event.email, event.password);
    });
  }
}
