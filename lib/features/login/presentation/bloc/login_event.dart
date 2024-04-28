// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class LoginEvent {}

class UsernameLoginEvent extends LoginEvent {
  String username;
  String password;
  UsernameLoginEvent({
    required this.username,
    required this.password,
  });
}

class ThirdPartyLoginEvent extends LoginEvent {
  bool isGoogle;
  ThirdPartyLoginEvent({
    required this.isGoogle,
  });
}
