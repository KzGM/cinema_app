import '../../domain/entities/ticket_entity.dart';

abstract class TicketEvent {}

class CreateTicketEvent extends TicketEvent {
  TicketEntity ticket;
  CreateTicketEvent({
    required this.ticket,
  });
}
