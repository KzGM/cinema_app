import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/model/bloc_status_state.dart';
import '../../data/models/ticket_model.dart';
import '../../domain/repository/ticket_repository.implement.dart';
import 'ticket_event.dart';
import 'ticket_state.dart';

class TicketBloc extends Bloc<TicketEvent, TicketState> {
  TicketBloc() : super(TicketState(status: BlocStatusState.initial)) {
    on<CreateTicketEvent>(_onGetTicketEvent);
  }

  final _repo = TicketRepositoryImplement();

  FutureOr<void> _onGetTicketEvent(
    CreateTicketEvent event,
    Emitter<TicketState> emit,
  ) async {
    emit(state.copyWith(status: BlocStatusState.loading));
    try {
      final _ = _repo.createTicket(
        TicketModel.fromEntity(event.ticket),
      ); //entity -> model
      emit(
        state.copyWith(
          status: BlocStatusState.success,
          message: 'Buy ticket successfully',
        ),
      );
      final getTickets = await _repo.readTickets(
        userId: FirebaseAuth.instance.currentUser?.uid ?? '',
      );
      print(getTickets);
    } catch (e) {
      emit(
        state.copyWith(
          status: BlocStatusState.failed,
          message: 'Failed to ticket',
        ),
      );
    }
  }
}
