import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const TokoKitaApp());
}

class TokoKitaApp extends StatelessWidget {
  const TokoKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'TokoKita', home: HomePage(), debugShowCheckedModeBanner: false);
  }
}
