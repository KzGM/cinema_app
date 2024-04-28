import 'dart:async';
import 'dart:math';

import 'package:cinema_app/features/login/domain/usecases/login_usecases.dart';
import 'package:cinema_app/features/login/domain/usecases/login_usecases.implement.dart';
import 'package:cinema_app/features/login/presentation/bloc/login_event.dart';
import 'package:cinema_app/features/login/presentation/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState()) {
    on<UsernameLoginEvent>(_onUsernameLoginEvent);
    on<ThirdPartyLoginEvent>(_onThirdPartyLoginEvent);
  }
  LoginUsecases _usecases = LoginUsecasesImplement();

  FutureOr<void> _onUsernameLoginEvent(
      UsernameLoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    try {
      final user = await _usecases.signInWithUsername(
          username: event.username.trim(), password: event.password.trim());
      if (user != null) {
        emit(LoginSuccesssfulState(
            message: 'Signin success with email: ${user.email}'));
      } else {
        emit(LoginFailedState(errorMessage: 'Account not found'));
      }
    } catch (e) {
      emit(LoginFailedState(errorMessage: e.toString()));
    }
    return null;
  }

  FutureOr<void> _onThirdPartyLoginEvent(
    ThirdPartyLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoadingState());
    if (event.isGoogle) {
      try {
        final user = await _usecases.signInWithGoogle();
        if (user == null) {
          emit(
            LoginThirdPartyFailedState(
              errorMessage: '''User not found''',
            ),
          );
        } else {
          emit(
            LoginSuccesssfulState(
              message: 'Signin success with email: ${user.email}',
            ),
          );
        }
      } catch (e) {
        emit(
          LoginThirdPartyFailedState(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }
}
