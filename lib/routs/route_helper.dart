import 'package:food_delivery/page/auth/sign_in_page.dart';
import 'package:food_delivery/page/cart/cart_page.dart';
import 'package:food_delivery/page/food/popular_food_detail.dart';
import 'package:food_delivery/page/food/recommended_food_detail.dart';
import 'package:food_delivery/page/home/home_page.dart';
import 'package:food_delivery/page/home/main_food_page.dart';
import 'package:food_delivery/page/splash/splash_page.dart';
import 'package:get/get.dart';

import '../page/auth/sign_up_page.dart';

class RouteHelper{
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String signIn = "/sign-in";
  static const String signUp = "/sign-up";

  static String getSplashPage()=> splashPage;
  static String getInitial() => initial;
  static String getPopularFood(int pageId , String page)=> '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page )=> '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage()=> cartPage;
  static String getSignInPage()=> signIn;
  static String getSignUpPage()=> signUp;

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: ()=> const SplashScreen()),

    // COMMENT THIS OUT - it conflicts with home: SplashScreen()
     GetPage(name: initial, page: ()=> HomePage()),
    GetPage(name: signIn, page: ()=> SignInPage(), transition: Transition.fade),
    GetPage(name: signUp, page: ()=> SignUpPage(), transition: Transition.fade),



    GetPage(name: popularFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
    }, transition: Transition.fadeIn),

    GetPage(name: recommendedFood, page: (){
      var pageId = Get.parameters['pageId'];
      var page = Get.parameters['page'];
      return RecommendedFoodDetail(pageId: int.parse(pageId!), page: page!);
    }, transition: Transition.fadeIn),

    GetPage(name: cartPage, page: (){
      return const CartPage();
    }, transition: Transition.fadeIn),
  ];
}