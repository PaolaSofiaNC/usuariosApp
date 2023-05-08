import 'db_helper.dart';

Future<List<Map<String, dynamic>>> getDataFromTable(String tableName,
    ) async {
  final db = await DatabaseProvider.db.database;
  List<Map<String, dynamic>> data;
  data = await db!.query(tableName);
  return data;
}
