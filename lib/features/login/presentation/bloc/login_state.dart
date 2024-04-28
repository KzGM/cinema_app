// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class LoginState {}

class InitialLoginState extends LoginState {
  InitialLoginState();
}

class LoginLoadingState extends LoginState {
  LoginLoadingState();
}

class LoginSuccesssfulState extends LoginState {
  String? message;
  LoginSuccesssfulState({this.message});
}

class LoginFailedState extends LoginState {
  String? errorMessage;
  bool? passwordFailed;
  bool? usernameFailed;
  LoginFailedState(
      {this.errorMessage, this.passwordFailed, this.usernameFailed});
}

class LoginThirdPartyFailedState extends LoginState {
  String? errorMessage;
  LoginThirdPartyFailedState({this.errorMessage});
}
