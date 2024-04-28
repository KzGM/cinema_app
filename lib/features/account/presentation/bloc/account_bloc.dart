import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/model/bloc_status_state.dart';
import '../../domain/repository/account_repository.dart';
import '../../domain/repository/account_repostory_implement.dart';
import 'account_event.dart';
import 'account_state.dart';

class AccountBloc extends Bloc<AccountEvent, AccountState> {
  AccountBloc() : super(AccountState(status: BlocStatusState.initial)) {
    on<GetAccountInfoEvent>(_onGetAccountInfoEvent);
    on<SetAccountInfoEvent>(_onSetAccountInfoEvent);
    on<SetAccountAvatarInfoEvent>(_onSetAccountAvatarInfoEvent);
  }
  final AccountRepository _repo = AccountRepositoryImplement();

  FutureOr<void> _onGetAccountInfoEvent(
    GetAccountInfoEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatusState.loading));
    try {
      final account = await _repo.getAccountInfo(userId: event.userId);
      if (account != null) {
        emit(
          state.copyWith(
            status: BlocStatusState.success,
            account: account,
            successMessage: 'Get user success',
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: BlocStatusState.failed,
            // errorMessage: 'User not found',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatusState.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onSetAccountInfoEvent(
    SetAccountInfoEvent event,
    Emitter<AccountState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatusState.loading));
    try {
      await _repo.setAccountInfo(event.entity);
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          successMessage: 'Update account successfully',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatusState.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  FutureOr<void> _onSetAccountAvatarInfoEvent(
    SetAccountAvatarInfoEvent event,
    Emitter<AccountState> emit,
  ) async {
    // Upload data to Storage
    // Get lại link
    // Update user data trên Firestore (change avatar_url)
    emit(state.copyWith(status: BlocStatusState.loading));
    try {
      final fileName =
          '''${event.entity.id ?? '--'}_${event.entity.email ?? event.entity.phoneNumber ?? '--'}'''; // string template
      final avatarUrl =
          await _repo.setAvatar(fileName: fileName, data: event.avatarData);
      if (avatarUrl != null) {
        final AvatarEntity = event.entity.copyWith(avatarUrl: avatarUrl);
        await _repo.setAccountInfo(AvatarEntity);
        emit(
          state.copyWith(
            status: BlocStatusState.success,
            successMessage: 'Update avatar successfully',
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: BlocStatusState.failed,
            errorMessage: 'Update avatar failed',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatusState.failed,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
