import 'package:flutter/material.dart';
import 'models/product.dart';
import 'widgets/product_card.dart';

void main() {
  runApp(const TokoKitaApp());
}

class TokoKitaApp extends StatelessWidget {
  const TokoKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Ambil 3 produk dengan status berbeda untuk demo reusable:
    // P1 Tersedia, P2 Stok Terbatas, P4 Habis
    final products = [dummyProducts[0], dummyProducts[1], dummyProducts[3]];

    return MaterialApp(
      title: 'TokoKita',
      home: Scaffold(
        appBar: AppBar(title: const Text('TokoKita')),
        body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return ProductCard(product: products[index]);
          },
        ),
      ),
    );
  }
}
