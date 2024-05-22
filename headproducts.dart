import 'package:flutter/material.dart';
import 'package:flutterproj1/main.dart';

class HairProductsPage extends StatelessWidget {
  final List<Product> hairProducts = [
    Product(
      imageUrl:
          'https://images-eu.ssl-images-amazon.com/images/G/42/Egypt-hq/2022/img/Consumer_Electronics/XCM_Manual_1454862_4881441_379x304_1X._SY304_CB630947473_.jpg',
      title: 'Hair Product 1',
      description: 'Description of Hair Product 1',
      price: 50.0,
    ),
    Product(
      imageUrl:
          'https://m.media-amazon.com/images/I/61Amk1yTq7L._AC_UL480_FMwebp_QL65_.jpg',
      title: 'Hair Product 2',
      description: 'Description of Hair Product 2',
      price: 75.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hair Section',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: hairProducts.length,
        itemBuilder: (context, index) {
          final product = hairProducts[index];
          return ProductCard(
            imageUrl: product.imageUrl,
            title: product.title,
            description: product.description,
            price: product.price,
          );
        },
      ),
    );
  }
}

class Product {
  final String imageUrl;
  final String title;
  final String description;
  final double price;

  Product({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });
}
