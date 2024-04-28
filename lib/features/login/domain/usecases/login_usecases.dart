import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginUsecases {
  Future<User?> signInWithUsername({
    required String username,
    required String password,
  });
  Future<User?> signInWithGoogle();
  Future<User?> signInWithFacebook();
}
