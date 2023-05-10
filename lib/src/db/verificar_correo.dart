import 'db_helper.dart';

Future<bool?> verificarCorreoExistente(String correo) async {
  final db = await DatabaseProvider.db.database;

  var respuesta =await db?.query(
    'usuarios',
    where: "correo = ?",
    whereArgs: [correo],
  );
  //print("La respuesta es: $respuesta");

    if (respuesta![0]['correo'] == correo){
    return true;
  }else{
    return false;
  }

}
