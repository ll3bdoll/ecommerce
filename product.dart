import 'package:flutter/material.dart';
import 'package:flutterproj1/main.dart';

class ProductDetailPage extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final double price;

  ProductDetailPage({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  final TextEditingController _quantityController = TextEditingController();

  void _addToCart() {
    int quantity = int.tryParse(_quantityController.text) ?? 0;
    if (quantity > 0) {
      // أضف الكود لإضافة المنتج إلى العربة مع الكمية المحددة هنا
      print('Added ${widget.name} x $quantity to cart');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added ${widget.name} x $quantity to cart'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter a valid quantity'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'More Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              widget.image,
              fit: BoxFit.cover,
              height: 300,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$${widget.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _quantityController,
                    decoration: InputDecoration(
                      labelText: 'Quantity',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _addToCart,
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
