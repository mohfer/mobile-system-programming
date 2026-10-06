import 'package:flutter/material.dart';
import '../models/product.dart';
import 'category_tag.dart';
import 'price_label.dart';
import 'stock_badge.dart';

class ProductCard extends StatefulWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    print('initState ProductCard ${widget.product.id}');
  }

  @override
  void dispose() {
    print('dispose ProductCard ${widget.product.id}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build ProductCard ${widget.product.id} isFavorite=$isFavorite');

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              height: 120,
              width: double.infinity,
              color: Colors.grey[200],
              child: Image.network(
                widget.product.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.image, size: 48);
                },
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.product.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            PriceLabel(price: widget.product.price),
            const SizedBox(height: 4),
            CategoryTag(category: widget.product.category),
            const SizedBox(height: 4),
            Row(
              children: [
                StockBadge(status: widget.product.getStatusStok()),
                const Spacer(),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
