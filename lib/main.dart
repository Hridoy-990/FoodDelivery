import 'package:flutter/material.dart';
import 'package:food_delivery/controllers/cart_controller.dart';
import 'package:food_delivery/controllers/popular_product_controller.dart';
import 'package:food_delivery/controllers/recommended_product_controller.dart';
import 'package:food_delivery/page/auth/sign_in_page.dart';
import 'package:food_delivery/page/auth/sign_up_page.dart';
import 'package:food_delivery/page/splash/splash_page.dart';
import 'package:food_delivery/routs/route_helper.dart';
import 'package:get/get.dart';
import 'helper/dependencies.dart' as dep;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();

  // Load data BEFORE app starts
  await Get.find<PopularProductController>().getPopularProductList();
  await Get.find<RecommendedProductController>().getRecommendedProductList();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(
        builder: (popularController) {
          return GetBuilder<RecommendedProductController>(
              builder: (recommendedController) {
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Food Delivery',
                  home: const SignInPage(),
                  //initialRoute: RouteHelper.getSplashPage(),
                  getPages: RouteHelper.routes,
                );
              }
          );
        }
    );
  }
}