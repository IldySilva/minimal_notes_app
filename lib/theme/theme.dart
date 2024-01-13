import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: ColorScheme.light(
        background: Colors.grey.shade300,
        primary: Colors.grey.shade200,
        secondary: Colors.grey.shade400,
        inversePrimary: Colors.grey.shade800));


ThemeData darkTheme = ThemeData(
  useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
        background: Colors.grey.shade900,
        secondary: Colors.grey.shade800,
        primary: Colors.grey.shade700,
        inversePrimary: Colors.grey.shade300));
