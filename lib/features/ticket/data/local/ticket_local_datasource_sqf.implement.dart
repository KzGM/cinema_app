import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/ticket_model.dart';
import 'ticket_local_datasource.dart';

class TicketLocalDatasourceSqfImplement extends TicketLocalDatasource {
  // Implement, SQFlite
  static Database? database; //static
  @override
  Future<void> initDB() async {
    database = await openDatabase(
      join(await getDatabasesPath(), 'new_vinemas.db'),
      onCreate: (db, version) {
        return db.execute('''
CREATE TABLE newTickets(
  id TEXT PRIMARY KEY,
  title TEXT,
  runTime REAL,
  filmFormat TEXT,
  theater TEXT,
  time TEXT,
  seats TEXT,
  unitPrice REAL,
  userId TEXT,
  createdAt TEXT)
''');
      },
      version: 1,
    );
  }

  @override
  Future<List<TicketModel>> readTickets({required String userId}) async {
    final result = await database
        ?.query('newTickets', where: 'userId = ?', whereArgs: [userId]);
    final tickets = result?.map(TicketModel.fromJson).toList();
    return tickets ?? [];
  }

  @override
  Future<void> createTicket(TicketModel ticket) async {
    final db = database;
    await db?.insert('newTickets', ticket.toJson());
  }

  @override
  Future<TicketModel> updateTicket(TicketModel newTicket) {
    // TODO: implement updateTicket
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTicket(String ticketId) async {
    final numberOfResult = await database
        ?.delete('newTickets', where: 'ticketId = ?', whereArgs: [ticketId]);
    print(numberOfResult);
  }

  @override
  void clearData() {
    // TODO: implement clearData
  }
}
