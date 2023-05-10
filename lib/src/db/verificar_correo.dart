import 'db_helper.dart';

Future<void> verificarCorreoExistente(String correo) async {
  final db = await DatabaseProvider.db.database;

  await db?.query(
    'usuarios',
    where: "correo = ?",
    whereArgs: [correo],
  );
}
