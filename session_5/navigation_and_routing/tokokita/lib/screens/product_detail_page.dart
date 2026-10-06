import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/category_tag.dart';
import '../widgets/price_label.dart';
import '../widgets/stock_badge.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int jumlah = 1;

  void _tambah() {
    if (widget.product.stock <= 0) return;
    setState(() => jumlah++);
  }

  void _kurang() {
    if (jumlah > 1) {
      setState(() => jumlah--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    final bool isOutOfStock = product.stock <= 0;
    final double totalHarga = product.price * jumlah;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    product.imageUrl,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 220,
                        color: Colors.grey[200],
                        alignment: Alignment.center,
                        child: const Icon(Icons.image, size: 64),
                      );
                    },
                  ),
                ),
                if (product is DiscountedProduct)
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Diskon ${product.discountPercent.toStringAsFixed(0)}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: StockBadge(status: product.getStatusStok()),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            product.name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        CategoryTag(category: product.category),
                      ],
                    ),
                    const SizedBox(height: 8),
                    PriceLabel(price: product.price),
                    const SizedBox(height: 8),
                    Text(
                      'Stok: ${product.stock} • ${product.getStatusStok()}',
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      product.description?.isNotEmpty == true
                          ? product.description!
                          : 'Tidak ada deskripsi.',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    const Text('Jumlah:'),
                    IconButton(
                      onPressed: isOutOfStock ? null : _kurang,
                      icon: const Icon(Icons.remove_circle_outline),
                    ),
                    Text(
                      '$jumlah',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: isOutOfStock ? null : _tambah,
                      icon: const Icon(Icons.add_circle_outline),
                    ),
                    const Spacer(),
                    Expanded(
                      child: Text(
                        formatRupiah(totalHarga),
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: isOutOfStock
                    ? null
                    : () {

                        Navigator.pop(context, jumlah);
                      },
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Tambah ke Keranjang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
