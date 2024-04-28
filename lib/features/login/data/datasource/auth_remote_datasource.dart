import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRemoteDatasource {
  Future<UserCredential?> signInWithUsername({
    required String username,
    required String password,
  });
  Future<UserCredential?> signInWithGoogle();
  Future<UserCredential?> signInWithFacebook();
}
