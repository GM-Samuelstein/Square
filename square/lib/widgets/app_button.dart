import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:square/utils/app_color_theme.dart';

class AppButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  final bool enabled;
  final bool loading;

  const AppButton({
    super.key,
    this.onPressed,
    this.label = 'Button',
    this.enabled = true,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onPressed : () {},
      child: Container(
        width: 343.w,
        height: 51.h,
        decoration: BoxDecoration(
          color: enabled
              ? AppColorTheme.primaryGreen
              : AppColorTheme.primaryGreen.withOpacity(0.6),
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Center(
          child: loading
              ? SizedBox(
                  height: 20.h,
                  width: 20.w,
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      color: AppColorTheme.white,
                    ),
                  ),
                )
              : Text(
                  label,
                  style: GoogleFonts.inter(
                    color: AppColorTheme.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ),
    );
  }
}
