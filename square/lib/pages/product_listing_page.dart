import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:square/models/product_model.dart';
import 'package:square/navigation/animated_navigation.dart';
import 'package:square/pages/product_details_page.dart';
import 'package:http/http.dart' as http;
import 'package:square/widgets/product_tile.dart';

class ProductListingPage extends StatefulWidget {
  const ProductListingPage({super.key});

  @override
  State<ProductListingPage> createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  AnimatedNavigation navigation = AnimatedNavigation();
  List<Product> products = [];

  goToProductDetails(Product product) {
    navigation.navigateTo(
      context: context,
      destinationScreen: ProductDetailsPage(
        product: product,
      ),
    );
  }

  fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      var jsonProducts = jsonDecode(response.body);
      for (final productItem in jsonProducts) {
        products.add(Product.fromJson(productItem));
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('H O M E  P A G E')),
      body: products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final prodc = products[index];
                return InkWell(
                  onTap: () {
                    goToProductDetails(prodc);
                  },
                  child: ProductTile(product: prodc),
                );
              },
            ),
    );
  }
}
