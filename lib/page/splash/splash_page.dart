import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../routs/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashScreen> with TickerProviderStateMixin {

 late Animation <double> animation;
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

    // Load data then navigate
    _loadResourceAndNavigate();
  }

 Future<void> _loadResourceAndNavigate() async {
   try {
     // Let animation play for at least 2 seconds
     await Future.delayed(const Duration(milliseconds: 2000));

     // Load data
     await Future.wait([
       Get.find<PopularProductController>().getPopularProductList(),
       Get.find<RecommendedProductController>().getRecommendedProductList(),
     ]);

     // Navigate after data loads
     if (mounted) {
       Get.offNamed(RouteHelper.getInitial());
     }
   } catch (e) {
     print('Error loading data: $e');
     if (mounted) {
       Get.snackbar(
         'Error',
         'Failed to load data. Please check your connection.',
         snackPosition: SnackPosition.BOTTOM,
         backgroundColor: Colors.red,
         colorText: Colors.white,
       );
     }
   }
 }

 @override
 void dispose() {
   controller.dispose();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(scale: animation,
          child: Center(child: Image.asset("assets/image/app_logo_1.jpg" ,
            width: Dimensions.splashImg))),
          Center(child: Image.asset("assets/image/app_logo_2.jpg" ,
            width: Dimensions.splashImg,)),
        ]
      ),
    );
  }
}
