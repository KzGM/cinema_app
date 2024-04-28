import 'package:cinema_app/main.dart';

import '../../data/models/ticket_model.dart';
import 'ticket_repository.dart';

class TicketRepositoryImplement extends TicketRepository {
  final _datasource = ticketDatasource;
  @override
  Future<void> createTicket(TicketModel ticket) {
    return _datasource.createTicket(ticket);
  }

  @override
  Future<void> delete({required String ticketId}) {
    return _datasource.deleteTicket(ticketId);
  }

  @override
  Future<List<TicketModel>> readTickets({required String userId}) {
    return _datasource.readTickets(userId: userId);
  }

  @override
  Future<TicketModel> updateTicket(TicketModel Ticket) {
    return _datasource.updateTicket(Ticket);
  }
}
