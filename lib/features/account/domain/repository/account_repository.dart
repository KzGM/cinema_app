import 'dart:typed_data';

import '../entities/account_entity.dart';

abstract class AccountRepository {
  // Get user from Firestore
  Future<AccountEntity?> getAccountInfo({required String userId});
  // Set user to Firestore
  Future<void> setAccountInfo(AccountEntity accountEntity);
  Future<String?> setAvatar({
    required String fileName,
    required Uint8List data,
  });
}
