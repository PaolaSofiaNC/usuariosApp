// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class DatabaseProvider {
  static const String clientTABLENAME = 'usuarios';

  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  static Database? _database;

   Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  static Future<Database> initDB() async {
    final db = await openDatabase(
      join(await getDatabasesPath(), "Usuarios.db"),
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  static _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $clientTABLENAME (id INTEGER PRIMARY KEY, nombre TEXT, correo TEXT, password TEXT, edad TEXT, telefono TEXT, genero TEXT)");
  }
}
