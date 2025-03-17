/* Honest Calorie, an open-source nutrition tracker
Copyright (C) 2025 Nicole Zubina

Full notice can be found at /lib/main.dart file. */

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:honest_calorie/db_singleton.dart';
import 'package:honest_calorie/src/types/food.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show rootBundle;

class FoodModel {
  late Database db;

  late List<Food> _presetFoods;

  late Future initFuture;

  FoodModel() {
    initFuture = init();
    if (kDebugMode) {
      print("Food model initialized");
    }
  }

  Future init() async {
    var responses =
        await Future.wait([DBSingleton.instance.database, _readPresetFoods()]);

    db = responses[0] as Database;
    _presetFoods = responses[1] as List<Food>;
  }

  Future<List<Food>> getFoodFiltered({String? name}) async {
    await Future.wait([initFuture]);
    return _presetFoods;
  }

  /// Returns a list of preset food, read from a JSON file in the assets folder.
  Future<List<Food>> _readPresetFoods() async {
    List<Food> readPresetFoods = List.empty(growable: true);

    var foodsJson = await rootBundle.loadString('assets/data/foods.json');
    final decodedList = jsonDecode(foodsJson) as List<dynamic>;
    readPresetFoods = decodedList
        .map((e) => Food.fromJson(e as Map<String, dynamic>))
        .toList();

    if (kDebugMode) {
      print('Read foods data from disk');
    }

    return readPresetFoods;
  }

  /// Creates a JSON file containing all the non-preset food
  /// and returns a path to it.
  Future<String> getFoodsJson() {
    // TODO: implement JSON file generation
    return Future.value("");
  }
}
