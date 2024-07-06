import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:square/models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:square/utils/app_color_theme.dart';
import 'package:square/utils/app_text_theme.dart';
import 'package:square/widgets/loading_widget.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 240.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: product.image,
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
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                '\$ ${product.price}',
                style: AppTextTheme.bodyLarge(
                  textColor: AppColorTheme.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 6.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                product.title,
                style: AppTextTheme.bodyMedium(
                  textColor: AppColorTheme.black,
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
