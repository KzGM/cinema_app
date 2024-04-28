// ignore_for_file: public_member_api_docs, sort_constructors_first
// One state
import '../../../../core/common/model/bloc_status_state.dart';
import '../../domain/entities/account_entity.dart';

class AccountState {
  BlocStatusState status;
  AccountEntity? account;
  String? successMessage;
  String? errorMessage;
  AccountState({
    required this.status,
    this.account,
    this.successMessage,
    this.errorMessage,
  });

  AccountState copyWith({
    required BlocStatusState status,
    AccountEntity? account,
    String? successMessage,
    String? errorMessage,
  }) {
    return AccountState(
      status: status,
      account: account ?? this.account, // cache
      successMessage: successMessage, // ko cache
      errorMessage: errorMessage, // ko cache
    );
  }
}
