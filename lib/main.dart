// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/components/shoppingcart_detail.dart';
import 'package:flutter_shoppingcart/components/shoppingcart_header.dart';
import 'package:flutter_shoppingcart/theme.dart';
import 'package:flutter_shoppingcart/components/product_selector_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _selectedProductId = 0;

  void _changeProduct(int id) {
    setState(() {
      _selectedProductId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
          SizedBox(width: 16),
        ],
        elevation: 0.0,
      ),
      body: Column(
        children: [
          ShoppingCartHeader(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProductSelectorButton(
                id: 0,
                mIcon: Icons.home,
                changeIcon: _changeProduct,
              ),
              ProductSelectorButton(
                id: 1,
                mIcon: Icons.business,
                changeIcon: _changeProduct,
              ),
              ProductSelectorButton(
                id: 2,
                mIcon: Icons.school,
                changeIcon: _changeProduct,
              ),
              ProductSelectorButton(
                id: 3,
                mIcon: Icons.wb_sunny,
                changeIcon: _changeProduct,
              ),
            ],
          ),
          Expanded(
            child: ShoppingCartDetail(
              productId: _selectedProductId,
            ),
          ),
        ],
      ),
    );
  }
}
