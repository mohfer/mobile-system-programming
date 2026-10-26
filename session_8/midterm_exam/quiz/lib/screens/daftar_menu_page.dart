import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_theme.dart';
import '../models/menu_item.dart';
import '../widgets/app_text.dart';
import 'detail_menu_page.dart';
import 'tambah_menu_page.dart';

class DaftarMenuPage extends StatefulWidget {
  const DaftarMenuPage({super.key});

  @override
  State<DaftarMenuPage> createState() => _DaftarMenuPageState();
}

class _DaftarMenuPageState extends State<DaftarMenuPage> {
  final List<MenuItem> _menu = [
    const MenuItem('Nasi Goreng Kampung', 15000),
    const MenuItem('Mie Ayam Bakso', 13000),
    const MenuItem('Ayam Geprek Sambal Ijo', 17000),
    const MenuItem('Es Teh Manis', 5000),
    const MenuItem('Pisang Goreng Keju', 10000),
  ];

  Future<void> _tambahMenu() async {
    final hasil = await Get.to<MenuItem>(() => const TambahMenuPage());
    if (hasil != null) {
      setState(() => _menu.add(hasil));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppText('Menu Kantin', heading: true, size: 20),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: AppText(
              'Pilih menu favoritmu hari ini',
              size: 14,
              color: kHijau.withValues(alpha: 0.7),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _menu.length,
              itemBuilder: (context, index) {
                final item = _menu[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.fastfood, color: kOranye),
                    title: AppText(
                      item.nama,
                      size: 16,
                      weight: FontWeight.w600,
                      color: kHijau,
                    ),
                    subtitle: AppText(
                      formatRupiah(item.harga),
                      size: 13,
                      color: kOranye,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () => Get.to(() => DetailMenuPage(item: item)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _tambahMenu,
        child: const Icon(Icons.add),
      ),
    );
  }
}
