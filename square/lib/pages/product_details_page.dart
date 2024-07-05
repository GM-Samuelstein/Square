import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:square/models/product_model.dart';
import 'package:square/utils/app_snack_bar.dart';
import 'package:square/widgets/app_button.dart';
import 'package:square/widgets/loading_widget.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('D E T A I L S  P A G E')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 350.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: widget.product.image,
                    placeholder: (context, url) => LoadingWidget(
                      width: double.infinity,
                      height: 240.h,
                    ),
                    errorWidget: (context, url, error) => LoadingWidget(
                      width: double.infinity,
                      height: 240.h,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(widget.product.title),

              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(widget.product.description),
              ),

              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Text('\$ ${widget.product.price}'),
                  ],
                ),
              ),

              SizedBox(height: 40.h),
              AppButton(
                label: 'Add to Cart',
                onPressed: () {
                  showSuccessSnackBar(context, 'Added to Cart');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
