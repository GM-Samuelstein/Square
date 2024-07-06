import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:square/models/product_model.dart';
import 'package:square/navigation/animated_navigation.dart';
import 'package:square/pages/product_details_page.dart';
import 'package:http/http.dart' as http;
import 'package:square/utils/app_text_theme.dart';
import 'package:square/widgets/app_button.dart';
import 'package:square/widgets/product_tile.dart';
import 'package:square/widgets/product_tile_placeholder.dart';
import 'package:lottie/lottie.dart';

class ProductListingPage extends StatefulWidget {
  const ProductListingPage({super.key});

  @override
  State<ProductListingPage> createState() => _ProductListingPageState();
}

class _ProductListingPageState extends State<ProductListingPage> {
  final AnimatedNavigation _navigation = AnimatedNavigation();
  final List<Product> _products = [];
  bool _errorOccured = false;

  _goToProductDetails(Product product) {
    _navigation.navigateTo(
      context: context,
      destinationScreen: ProductDetailsPage(
        product: product,
      ),
    );
  }

  _fetchProducts() async {
    try {
      final response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));

      if (response.statusCode == 200) {
        var jsonProducts = jsonDecode(response.body);
        for (final productItem in jsonProducts) {
          _products.add(Product.fromJson(productItem));
        }
        setState(() {});
      } else {
        _errorOccured = true;
        setState(() {});
      }
    } catch (e) {
      _errorOccured = true;
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'H O M E  P A G E',
          style: AppTextTheme.headlineSmall(),
        ),
        automaticallyImplyLeading: false,
      ),
      body: _errorOccured
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 250.h,
                    width: 250.h,
                    child: Lottie.asset(
                      'assets/network_error.json',
                      fit: BoxFit.fill,
                    ),
                  ),
                  SizedBox(
                    width: 280.w,
                    child: Text(
                      'An internet error occured, please try again.',
                      style: AppTextTheme.bodyLarge(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  AppButton(
                    label: 'Try Again',
                    onPressed: () {
                      _errorOccured = false;
                      _fetchProducts();
                      setState(() {});
                    },
                  ),
                ],
              ),
            )
          : _products.isEmpty
              ? ListView(
                  children: [
                    for (var i = 0; i < 4; i++) const ProductTilePlaceholder()
                  ],
                )
              : ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    final prodc = _products[index];
                    return InkWell(
                      onTap: () {
                        _goToProductDetails(prodc);
                      },
                      child: ProductTile(product: prodc),
                    );
                  },
                ),
    );
  }
}
