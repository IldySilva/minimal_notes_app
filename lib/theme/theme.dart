import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    iconTheme: const IconThemeData(color: Colors.black),
    colorScheme: ColorScheme.light(
        background: Colors.grey.shade100,
        secondary: Colors.grey.shade200,
        primary: Colors.grey.shade400,
        inversePrimary: Colors.grey.shade800));


ThemeData darkTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    iconTheme: const IconThemeData(color: Colors.white),
    colorScheme: ColorScheme.light(
        background: Colors.grey.shade900,
        secondary: Colors.grey.shade700,
        primary: Colors.grey.shade400,
        inversePrimary: Colors.grey.shade100));
