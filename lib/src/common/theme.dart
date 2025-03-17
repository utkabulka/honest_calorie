/* Honest Calorie, an open-source nutrition tracker
Copyright (C) 2025 Nicole Zubina

Full notice can be found at /lib/main.dart file. */

import 'package:flutter/material.dart';

// Design
const defaultCircularRadius = Radius.circular(12);
const defaultRoundedRectangleTop = RoundedRectangleBorder(
  borderRadius: BorderRadius.only(
      topLeft: defaultCircularRadius, topRight: defaultCircularRadius),
);

// Shadows
const subtleShadow =
    BoxShadow(color: Colors.black12, offset: Offset(0, 0), blurRadius: 5);

// Prefs
const String PREF_THEME_MODE = "themeMode";
const String PERF_THEME_SYSTEM = "system";
const String PERF_THEME_LIGHT = "light";
const String PERF_THEME_DARK = "dark";

ThemeMode getThemeModeFromKey(String key) {
  switch (key) {
    case PERF_THEME_LIGHT:
      return ThemeMode.light;
    case PERF_THEME_DARK:
      return ThemeMode.dark;
    case PERF_THEME_SYSTEM:
    default:
      return ThemeMode.system;
  }
}

String themeModeToPrefKey(ThemeMode themeMode) {
  switch (themeMode) {
    case ThemeMode.light:
      return PERF_THEME_LIGHT;
    case ThemeMode.dark:
      return PERF_THEME_DARK;
    case ThemeMode.system:
      return PERF_THEME_SYSTEM;
  }
}
