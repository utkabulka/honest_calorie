/* Honest Calorie, an open-source nutrition tracker
Copyright (C) 2025 Nicole Zubina

Full notice can be found at /lib/main.dart file. */

import 'package:json_annotation/json_annotation.dart';

part 'food.g.dart';

@JsonSerializable(includeIfNull: false)
class Food {
  Food({
    this.name = "Unnamed food",
    this.calories = 0,
    this.protein,
    this.fat,
    this.totalCarbs,
    this.sugars,
    this.fiber,
  });

  factory Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);
  Map<String, dynamic> toJson() => _$FoodToJson(this);

  String name = "Unnamed food";
  int calories = 0;

  double? protein;

  double? fat;

  /// Includes sugar.
  double? totalCarbs;
  double? sugars;

  double? fiber;

  String getTextCalorieSummary() {
    return '${calories.toString()} kcal per 100 grams';
  }
}
