import 'package:cinema_app/features/login/domain/repository/login_repository.dart';
import 'package:cinema_app/features/login/domain/repository/login_repository.implement.dart';
import 'package:cinema_app/features/login/domain/usecases/login_usecases.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginUsecasesImplement extends LoginUsecases {
  final LoginRepository _repo = LoginRepositoryImplement();
  @override
  Future<User?> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<User?> signInWithGoogle() async {
    final UserCredential = await _repo.signInWithGoogle();
    return UserCredential?.user;
  }

  @override
  Future<User?> signInWithUsername(
      {required String username, required String password}) async {
    final userCred =
        await _repo.signInWithUsername(username: username, password: password);
    return userCred?.user;
  }
}
