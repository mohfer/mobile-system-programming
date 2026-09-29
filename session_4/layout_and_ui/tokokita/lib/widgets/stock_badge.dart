import 'package:flutter/material.dart';

class StockBadge extends StatelessWidget {
  final String status;

  const StockBadge({super.key, required this.status});

  Color _badgeColor() {
    switch (status) {
      case 'Tersedia':
        return Colors.green;
      case 'Stok Terbatas':
        return Colors.orange;
      case 'Habis':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: _badgeColor(),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        status,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
