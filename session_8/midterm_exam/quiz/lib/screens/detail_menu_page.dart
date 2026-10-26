import 'package:flutter/material.dart';

import '../app_theme.dart';
import '../models/menu_item.dart';
import '../widgets/app_text.dart';

class DetailMenuPage extends StatelessWidget {
  const DetailMenuPage({super.key, required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText('Detail Menu', heading: true, size: 20),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu, size: 72, color: kOranye),
            const SizedBox(height: 16),
            AppText(
              item.nama,
              heading: true,
              size: 24,
              weight: FontWeight.w700,
              color: kHijau,
            ),
            const SizedBox(height: 8),
            AppText(formatRupiah(item.harga), size: 18, color: kOranye),
          ],
        ),
      ),
    );
  }
}
