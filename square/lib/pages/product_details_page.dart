import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:square/models/product_model.dart';
import 'package:square/utils/app_color_theme.dart';
import 'package:square/utils/app_snack_bar.dart';
import 'package:square/utils/app_text_theme.dart';
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
      appBar: AppBar(
        title: Text(
          'D E T A I L S  P A G E',
          style: AppTextTheme.headlineSmall(),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 360.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    width: double.infinity,
                    imageUrl: widget.product.image,
                    height: 360.h,
                    placeholder: (context, url) => LoadingWidget(
                      width: double.infinity,
                      height: 360.h,
                    ),
                    errorWidget: (context, url, error) => LoadingWidget(
                      width: double.infinity,
                      height: 360.h,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.product.title,
                  style: AppTextTheme.headlineLarge(),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Text(
                      'DESCRIPTION',
                      style: AppTextTheme.bodyLarge(
                        textColor: AppColorTheme.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  widget.product.description,
                  style: AppTextTheme.bodyMedium(),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Text(
                      'PRICE',
                      style: AppTextTheme.bodyLarge(
                        textColor: AppColorTheme.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    Text(
                      '\$ ${widget.product.price}',
                      style: AppTextTheme.bodyMedium(),
                    ),
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
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
