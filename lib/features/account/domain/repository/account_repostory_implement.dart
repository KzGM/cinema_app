import 'dart:typed_data';

import '../../data/datasource/account_datasource.dart';
import '../../data/datasource/account_datasource_implement.dart';
import '../../data/models/account_model.dart';
import '../entities/account_entity.dart';
import 'account_repository.dart';

class AccountRepositoryImplement extends AccountRepository {
  // Không dùng DI
  // Khai báo ràng buộc
  final AccountDatasource _datasource = AccountDatasourceImplement(); // SOLID
  @override
  Future<AccountEntity?> getAccountInfo({required String userId}) async {
    final model = await _datasource.getAccountInfo(userId);
    // Converter
    return model?.toEntity();
  }

  @override
  Future<void> setAccountInfo(AccountEntity accountEntity) async {
    final model = AccountModel.fromEntity(accountEntity);
    await _datasource.setAccountInfo(model);
  }

  @override
  Future<String?> setAvatar({
    required String fileName,
    required Uint8List data,
  }) {
    return _datasource.setAvatar(fileName: fileName, data: data);
  }
}
