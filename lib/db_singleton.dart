/* Honest Calorie, an open-source nutrition tracker
Copyright (C) 2025 Nicole Zubina

Full notice can be found at /lib/main.dart file. */

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBSingleton {
  static final DBSingleton instance = DBSingleton._privateConstructor();
  static Database? _database;
  DBSingleton._privateConstructor();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), "calorie_tracker.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE food (
            id INTEGER PRIMARY KEY,
            name TINYTEXT,
            notes TEXT,
            calories INTEGER,
            protein FLOAT,
            fat FLOAT,
            totalCarbs FLOAT,
            sugars FLOAT,
            fiber FLOAT
          );
        ''');
      },
    );
  }
}
