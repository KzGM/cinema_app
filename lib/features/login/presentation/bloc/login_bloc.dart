import 'package:cinema_app/features/login/presentation/bloc/login_event.dart';
import 'package:cinema_app/features/login/presentation/bloc/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(InitialLoginState()) {
    on<UsernameLoginEvent>(_onUsernameLoginEvent);
  }

  Future? _onUsernameLoginEvent(
      UsernameLoginEvent event, Emitter<LoginState> emit) {
    return null;
  }
}
