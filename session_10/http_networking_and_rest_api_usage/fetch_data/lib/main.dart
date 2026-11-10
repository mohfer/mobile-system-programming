import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(const ExplorerApp());
}

class ExplorerApp extends StatelessWidget {
  const ExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF176B68);
    return MaterialApp(
      title: 'Explorer',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: accent,
          brightness: Brightness.light,
          surface: const Color(0xFFF4F7F6),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F7F6),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF4F7F6),
          surfaceTintColor: Colors.transparent,
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 1,
          margin: const EdgeInsets.only(bottom: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
