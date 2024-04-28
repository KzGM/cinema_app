import '../../data/models/ticket_model.dart';

abstract class TicketRepository {
  Future<void> createTicket(TicketModel ticket);
  Future<List<TicketModel>> readTickets({required String userId});
  Future<TicketModel> updateTicket(TicketModel newTicket);
  Future<void> delete({required String ticketId});
}
