// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import '../../domain/entities/account_entity.dart';

abstract class AccountEvent {}

class GetAccountInfoEvent extends AccountEvent {
  // user id
  String userId;
  GetAccountInfoEvent({
    required this.userId,
  });
}

class SetAccountInfoEvent extends AccountEvent {
  AccountEntity entity;
  SetAccountInfoEvent({
    required this.entity,
  });
}

class SetAccountAvatarInfoEvent extends AccountEvent {
  AccountEntity entity;
  Uint8List avatarData;
  SetAccountAvatarInfoEvent({
    required this.entity,
    required this.avatarData,
  });
}
