import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _openDetail(BuildContext context, Product product) async {

    final result = await Navigator.pushNamed(
      context,
      '/detail',
      arguments: product,
    );

    if (!context.mounted) return;
    if (result != null && result is int) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${product.name} x$result ditambahkan ke keranjang'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    final List<Product> products = dummyProducts;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TokoKita',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Belanja jadi lebih mudah',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.shopping_cart_outlined),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return InkWell(
                    onTap: () => _openDetail(context, product),
                    child: ProductCard(product: product),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
