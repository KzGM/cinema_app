import 'dart:typed_data';

import '../models/account_model.dart';

abstract class AccountDatasource {
  Future<AccountModel?> getAccountInfo(String userId);
  Future<void> setAccountInfo(AccountModel accountModel);
  Future<String?> setAvatar({
    required String fileName,
    required Uint8List data,
  });
}
