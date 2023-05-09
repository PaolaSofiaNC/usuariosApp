import 'db_helper.dart';

Future<void> deleteUsuario(int id) async {
    final db = await DatabaseProvider.db.database;

    await db?.delete(
      'usuarios',
       where: "id = ?",
      whereArgs: [id],
    );
  }