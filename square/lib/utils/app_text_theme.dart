import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:square/utils/app_color_theme.dart';

class AppTextTheme {
  static TextStyle headlineLarge({
    Color textColor = AppColorTheme.black,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return GoogleFonts.inter(
      fontSize: 30.sp,
      fontWeight: fontWeight,
      color: textColor,
    );
  }

  static TextStyle headlineSmall({
    Color textColor = AppColorTheme.black,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return GoogleFonts.inter(
      fontSize: 24.sp,
      fontWeight: fontWeight,
      color: textColor,
    );
  }

  static TextStyle bodyLarge({
    Color textColor = AppColorTheme.gray4,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return GoogleFonts.inter(
      fontSize: 16.sp,
      fontWeight: fontWeight,
      color: textColor,
    );
  }

  static TextStyle bodyMedium({
    Color textColor = AppColorTheme.gray4,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: fontWeight,
      color: textColor,
    );
  }

  static TextStyle bodySmall({
    Color textColor = AppColorTheme.gray4,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return GoogleFonts.inter(
      fontSize: 10.sp,
      fontWeight: fontWeight,
      color: textColor,
    );
  }
}
