import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:square/widgets/shimmer.dart';

const _shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.width,
    required this.height,
    this.isText = false,
  });

  final double width;
  final double height;
  final bool isText;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      linearGradient: _shimmerGradient,
      child: ShimmerLoading(
        isLoading: true,
        child: Container(
          width: width,
          height: height,
          decoration:  BoxDecoration(
            color: Colors.black,
            borderRadius: isText ? BorderRadius.circular(12.r): null
          ),
        ),
      ),
    );
  }
}
