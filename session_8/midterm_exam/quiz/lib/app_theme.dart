import 'package:flutter/material.dart';

const kHijau = Color(0xFF09251C);
const kOranye = Color(0xFFA55704);
const kTan = Color(0xFFF3D2AF);
const kKrem = Color(0xFFF8EADC);

final ThemeData kantinTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: kOranye,
    primary: kOranye,
    secondary: kHijau,
    surface: kKrem,
  ),
  scaffoldBackgroundColor: kKrem,
  appBarTheme: const AppBarTheme(
    backgroundColor: kHijau,
    foregroundColor: kKrem,
  ),
  cardTheme: const CardThemeData(color: kTan, elevation: 0),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: kOranye,
    foregroundColor: kKrem,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: kOranye,
      foregroundColor: kKrem,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: kTan,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  ),
);
