import 'package:usuarios/src/models/usuario.dart';

import 'db_helper.dart';

class InsertarUsuario {
  Future<int?> agregarCliente(Usuario users) async {
    final db = await DatabaseProvider.db.database;
    int id = await db!.insert(DatabaseProvider.clientTABLENAME, users.toMap());
    return id;
  }
}
