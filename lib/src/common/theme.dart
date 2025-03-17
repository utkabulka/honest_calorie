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
const String prefThemeMode = "themeMode";
const String prefThemeSystem = "system";
const String prefThemeLight = "light";
const String prefThemeDark = "dark";

ThemeMode getThemeModeFromKey(String key) {
  switch (key) {
    case prefThemeLight:
      return ThemeMode.light;
    case prefThemeDark:
      return ThemeMode.dark;
    case prefThemeSystem:
    default:
      return ThemeMode.system;
  }
}

String themeModeToPrefKey(ThemeMode themeMode) {
  switch (themeMode) {
    case ThemeMode.light:
      return prefThemeLight;
    case ThemeMode.dark:
      return prefThemeDark;
    case ThemeMode.system:
      return prefThemeSystem;
  }
}
