// DAO
import '../models/ticket_model.dart';

abstract class TicketLocalDatasource {
  void initDB();
  Future<List<TicketModel>> readTickets({required String userId});
  Future<void> createTicket(TicketModel ticket);
  Future<TicketModel> updateTicket(TicketModel newTicket);
  Future<void> deleteTicket(String ticketId);
  void clearData();
}
