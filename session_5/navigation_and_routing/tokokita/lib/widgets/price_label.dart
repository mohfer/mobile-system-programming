import 'package:flutter/material.dart';
import '../models/product.dart';

class PriceLabel extends StatelessWidget {
  final double price;

  const PriceLabel({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      formatRupiah(price),
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}
