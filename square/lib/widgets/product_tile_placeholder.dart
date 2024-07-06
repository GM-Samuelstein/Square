import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:square/widgets/loading_widget.dart';

class ProductTilePlaceholder extends StatelessWidget {
  const ProductTilePlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoadingWidget(width: double.infinity, height: 240.h),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: LoadingWidget(width: 50.w, height: 20.h, isText: true),
            ),
            SizedBox(height: 6.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: LoadingWidget(width: 120.w, height: 20.h, isText: true),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
