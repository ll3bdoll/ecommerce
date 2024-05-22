import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartProduct> cartProducts = [
    CartProduct(
      name: 'Product 1',
      description: 'Description for Product 1',
      price: 29.99,
      image:
          'https://images-eu.ssl-images-amazon.com/images/G/42/Egypt-hq/2022/img/Consumer_Electronics/XCM_Manual_1454862_4881441_379x304_1X._SY304_CB630947473_.jpg',
    ),
    CartProduct(
      name: 'Product 2',
      description: 'Description for Product 2',
      price: 19.99,
      image:
          'https://images-eu.ssl-images-amazon.com/images/G/42/Egypt-hq/2022/img/Consumer_Electronics/XCM_Manual_1454862_4881441_379x304_1X._SY304_CB630947473_.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double grandTotal = cartProducts.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: cartProducts.isNotEmpty
                ? ListView.builder(
                    itemCount: cartProducts.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image:
                                        NetworkImage(cartProducts[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartProducts[index].name,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(cartProducts[index].description),
                                    SizedBox(height: 8),
                                    Text(
                                      '\$${cartProducts[index].price.toStringAsFixed(2)}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  setState(() {
                                    removeFromCart(index);
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Center(
                    child: Text('Your cart is empty!'),
                  ),
          ),
          if (cartProducts.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Grand Total: Nrs. ${grandTotal.toStringAsFixed(2)}/-',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // استمر في التسوق
                          },
                          child: Text('Continue Shopping'),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            cartProducts.clear();
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Delete All Items'),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red, // تغيير لون الزر إلى الأحمر
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // تنفيذ عملية الشراء
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(0.2),
                          child: Text('Proceed to Checkout'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  void removeFromCart(int index) {
    setState(() {
      cartProducts.removeAt(index);
    });
  }
}

class CartProduct {
  final String name;
  final String description;
  final double price;
  final String image;

  CartProduct({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}
