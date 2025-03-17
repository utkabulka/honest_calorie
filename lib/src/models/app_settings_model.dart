/* Honest Calorie, an open-source nutrition tracker
Copyright (C) 2025 Nicole Zubina

Full notice can be found at /lib/main.dart file. */

import 'package:flutter/material.dart';
import 'package:honest_calorie/src/common/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsModel extends ChangeNotifier {
  late SharedPreferencesAsync prefs;

  AppSettingsModel() {
    _initPrefs();
  }

  Future _initPrefs() async {
    prefs = SharedPreferencesAsync();

    _themeMode = getThemeModeFromKey(
        await prefs.getString(PREF_THEME_MODE) ?? PERF_THEME_SYSTEM);

    notifyListeners();
  }

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  set themeMode(ThemeMode value) {
    _themeMode = value;
    prefs.setString(PREF_THEME_MODE, themeModeToPrefKey(_themeMode));
    notifyListeners();
  }

  // TODO: implement metric and imperial measurements
  bool useMetric = true;

  // journal settings
  bool relativeDates = true;
}
