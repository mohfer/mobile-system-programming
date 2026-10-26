import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_theme.dart';
import 'screens/daftar_menu_page.dart';

void main() {
  runApp(const KantinApp());
}

class KantinApp extends StatelessWidget {
  const KantinApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Menu Kantin',
      debugShowCheckedModeBanner: false,
      theme: kantinTheme,
      home: const DaftarMenuPage(),
    );
  }
}
