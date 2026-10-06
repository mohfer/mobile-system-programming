import 'package:flutter/material.dart';
import 'models/product.dart';
import 'screens/home_page.dart';
import 'screens/main_page.dart';
import 'screens/product_detail_page.dart';

void main() {
  runApp(const TokoKitaApp());
}

class TokoKitaApp extends StatelessWidget {
  const TokoKitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TokoKita',
      debugShowCheckedModeBanner: false,

      initialRoute: '/',

      routes: {
        '/': (context) => const MainPage(),
        '/home': (context) => const HomePage(),
        '/detail': (context) {

          final args = ModalRoute.of(context)!.settings.arguments;
          final product = args as Product;
          return ProductDetailPage(product: product);
        },
      },
    );
  }
}
