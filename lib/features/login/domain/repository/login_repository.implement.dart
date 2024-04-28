import 'package:cinema_app/features/login/data/datasource/auth_remote_datasource.dart';
import 'package:cinema_app/features/login/data/datasource/auth_remote_datasource.implement.dart';
import 'package:cinema_app/features/login/domain/repository/login_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepositoryImplement extends LoginRepository {
  final AuthRemoteDatasource _authDatasource = AuthRemoteDatasourceImplement();
  @override
  Future<UserCredential?> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<UserCredential?> signInWithGoogle() {
    return _authDatasource.signInWithGoogle();
  }

  @override
  Future<UserCredential?> signInWithUsername(
      {required String username, required String password}) {
    return _authDatasource.signInWithUsername(
        username: username, password: password);
  }
}
