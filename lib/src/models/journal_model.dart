/* Honest Calorie, an open-source nutrition tracker
Copyright (C) 2025 Nicole Zubina

Full notice can be found at /lib/main.dart file. */

import 'package:flutter/foundation.dart';
import 'package:honest_calorie/db_singleton.dart';
import 'package:sqflite/sqflite.dart';

class JournalModel {
  late Database db;

  DateTime selectedDate = DateTime.now();

  JournalModel() {
    init();
    if (kDebugMode) {
      print("Journal model initialized");
    }
  }

  Future init() async {
    db = await DBSingleton.instance.database;
  }
}
