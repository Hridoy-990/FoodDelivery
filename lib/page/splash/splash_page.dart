import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_delivery/page/home/home_page.dart'; // Change this import
import 'package:food_delivery/utils/dimensions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2)
    )..forward();

    animation = CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut
    );

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomePage()), // Changed to HomePage
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                  scale: animation,
                  child: Image.asset(
                    "assets/image/app_logo_1.jpg",
                    width: Dimensions.splashImg,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.fastfood, size: 100, color: Colors.grey);
                    },
                  )
              ),
              const SizedBox(height: 20),
              Image.asset(
                "assets/image/app_logo_2.jpg",
                width: Dimensions.splashImg,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.restaurant, size: 100, color: Colors.grey);
                },
              ),
            ]
        ),
      ),
    );
  }
}