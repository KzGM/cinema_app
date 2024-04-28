// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../core/common/model/bloc_status_state.dart';

class TicketState {
  BlocStatusState status;
  String? message;
  TicketState({
    required this.status,
    this.message,
  });

  TicketState copyWith({
    required BlocStatusState status,
    String? message,
  }) {
    return TicketState(
      status: status,
      message: message,
    );
  }
}
