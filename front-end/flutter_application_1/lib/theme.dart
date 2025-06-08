// lib/theme/app_theme.dart
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: Colors.purple[700],
  scaffoldBackgroundColor: Colors.grey[50],
  fontFamily: 'Roboto',
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.white,
    foregroundColor: Colors.purple[700],
    elevation: 0,
  ),
  chipTheme: ChipThemeData(
    backgroundColor: Colors.purple[700],
    labelStyle: const TextStyle(color: Colors.white),
  ),
);