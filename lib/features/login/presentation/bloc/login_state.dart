abstract class LoginState {}

class InitialLoginState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccesssfulState extends LoginState {
  String? message;
}

class LoginFailedState extends LoginState {
  String? message;
  bool? isFailedAtPassword;
  bool? isFailedAtUsername;
}
