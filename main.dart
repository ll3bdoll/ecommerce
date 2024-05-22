import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutterproj1/about.dart';
import 'package:flutterproj1/bodyproducts.dart';
import 'package:flutterproj1/cart.dart';
import 'package:flutterproj1/faceproducts.dart';
import 'package:flutterproj1/headproducts.dart';

import 'package:flutterproj1/product.dart';
import 'package:flutterproj1/contact.dart';
import 'package:flutterproj1/login.dart';
import 'package:flutterproj1/register.dart';

class ProductCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double price;

  ProductCard({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Price: \$${price.toString()}',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // إضافة المنتج إلى السلة
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailPage(
                      image: imageUrl,
                      description: description,
                      price: price,
                      name: title,
                    ),
                  ),
                );
              },
              child: Text(
                'Add to Cart & more Details',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategorySlider extends StatelessWidget {
  final List<Category> categories = [
    Category(
        'Category 1',
        'https://images-eu.ssl-images-amazon.com/images/G/42/Egypt-hq/2022/img/Consumer_Electronics/XCM_Manual_1454862_4881441_379x304_1X._SY304_CB630947473_.jpg',
        'Learn More'),
    Category(
        'Category 2',
        'https://images-eu.ssl-images-amazon.com/images/G/42/Egypt-hq/2022/img/Consumer_Electronics/XCM_Manual_1454862_4881441_379x304_1X._SY304_CB630947473_.jpg',
        'Learn More'),
    Category(
        'Category 3',
        'https://images-eu.ssl-images-amazon.com/images/G/42/Egypt-hq/2022/img/Consumer_Electronics/XCM_Manual_1454862_4881441_379x304_1X._SY304_CB630947473_.jpg',
        'Learn More'),
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 6,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: .8,
      ),
      items: categories.map((category) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Category",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Image.network(category.imageUrl, fit: BoxFit.cover),
                  SizedBox(height: 10),
                  Text(category.name, style: TextStyle(fontSize: 16.0)),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Define what happens when the button is pressed
                    },
                    child: Text(category.buttonText),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class Category {
  final String name;
  final String imageUrl;
  final String buttonText;

  Category(this.name, this.imageUrl, this.buttonText);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '3Care',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  myhome createState() => myhome();
}

class myhome extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool ifsearch = false;
  String searcht = "";

  void checksearch() {
    setState(() {
      ifsearch = !ifsearch;
      if (!ifsearch) {
        searcht = "";
      }
    });
  }

//...................................................................
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (ifsearch) {
          checksearch();
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
          title: Row(
            children: [
              Spacer(),
              Text(
                '3care',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Spacer(),
              if (ifsearch)
                Container(
                  width: 150,
                  child: TextField(
                    autofocus: true,
                    onChanged: (value) {
                      setState(() {
                        searcht = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
            ],
          ),
          actions: [
            if (!ifsearch)
              IconButton(
                icon: Icon(Icons.search),
                onPressed: checksearch,
              ),
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey[50],
                ),
                child: const Text(
                  '3Care For Ever',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.login),
                title: const Text(
                  'Login',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 8, 203, 14),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.app_registration),
                title: Text(
                  'Register',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 20, 20, 20),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
              ),
              Divider(),
              ListTile(
                title: Text(
                  'Body',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BodyProductsPage()),
                  );

                  // Handle Body navigation
                },
              ),
              ListTile(
                title: Text(
                  'Hair',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HairProductsPage()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Face',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FaceProductsPage()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'About',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutPage()),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Contact',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactPage()),
                  );
                },
              ),
              Spacer(),
              Divider(),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: ListView(
          children: [
            CarouselSlider(
              items: [
                Image.network(
                    'https://www.eg.sohaticare.com/cdn/shop/files/WhatsApp_Image_2024-05-10_at_5.18.21_PM_1_1944x.jpg?v=1715785612',
                    fit: BoxFit.cover),
                Image.network(
                    'https://www.eg.sohaticare.com/cdn/shop/files/Beesline_Old_Prices_Are_Back_Desktop_Banner_1944x.jpg?v=1715761339',
                    fit: BoxFit.cover),
                Image.network(
                    'https://www.eg.sohaticare.com/cdn/shop/files/Eucerin_Launch_Desktop_Banner_70616b9b-66f2-4725-b4b3-ab7c346325f4_1944x.jpg?v=1692624442',
                    fit: BoxFit.cover),
                Image.network(
                    'https://www.eg.sohaticare.com/cdn/shop/files/Dermactive_Acti-white_Range_Desktop_Banner_1944x.jpg?v=1713259731',
                    fit: BoxFit.cover),
              ],
              options: CarouselOptions(
                height: 100,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 1,
              ),
            ),
            CategorySlider(),
            Spacer(),
            const Text(
              "Lock Our Products",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            ProductCard(
              imageUrl:
                  'https://images-eu.ssl-images-amazon.com/images/G/42/Egypt-hq/2022/img/Consumer_Electronics/XCM_Manual_1454862_4881441_379x304_1X._SY304_CB630947473_.jpg',
              title: 'Product name',
              description:
                  'Product Description dkjlksjsdklkljdkljsdjlksdlkjdskljdsjkldkjljlkds',
              price: 100.0,
            ),
            ProductCard(
              imageUrl:
                  'https://m.media-amazon.com/images/I/61Amk1yTq7L._AC_UL480_FMwebp_QL65_.jpg',
              title: 'Product name',
              description:
                  'Product Description dkjlksjsxzzzzzzzzdklkljdkljsdjlksdlkjdskljdsjkldkjljlkds',
              price: 120.0,
            ),
          ],
        ),
      ),
    );
  }
}
