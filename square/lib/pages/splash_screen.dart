import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:square/navigation/animated_navigation.dart';
import 'package:square/pages/product_listing_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AnimatedNavigation _navigation = AnimatedNavigation();

  void _goToSignupScreen() => _navigation.navigateTo(
        context: context,
        destinationScreen: const ProductListingPage(),
      );

  void _nextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    _goToSignupScreen();
  }

  @override
  void initState() {
    super.initState();
    _nextScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/splash_logo.png',
          width: 240.w,
        ),
      ),
    );
  }
}
