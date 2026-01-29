import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/page/auth/sign_up_page.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_file.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/app_constants.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: Dimensions.screenHeight*0.05,),
            // app logo
            Container(
              height: Dimensions.screenHeight * 0.25,
              child: Center(
                child: CircleAvatar(
                  radius: Dimensions.radius20 * 4,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    "assets/image/logo_part_1.png",
                  ),
                ),
              ),
            ),
            //Welcome text
            Container(
              margin: EdgeInsets.only(left: Dimensions.width20),
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppConstants.HELLO,
                    style: TextStyle(
                      fontSize: Dimensions.font20*3 + Dimensions.font20/2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: Dimensions.height10/2,),
                  BigText(text: "Sign into your account", size: Dimensions.font16, color: Colors.grey,),
                ],
              ),
            ),
            SizedBox(height: Dimensions.height20,),
            //email field
            AppTextFile(icon: Icons.email, textEditingController: emailController, hintText: "Email",),
            SizedBox(height: Dimensions.height20,),
            // password field
            AppTextFile(icon: Icons.password_sharp, textEditingController: passwordController, hintText: "Password",),
            SizedBox(height: Dimensions.height20,),
            //Sign in options
            Row(
           children: [
             Expanded(child: Container()),
             RichText(
               text: TextSpan(
                 text: "Sign in with one of the following methods",
                 style: TextStyle(
                   color: Colors.grey[500],
                   fontSize: Dimensions.font16,
                 ),
               ),
             ),
             SizedBox(width: Dimensions.width20,)
           ],
           ),
            SizedBox(height: Dimensions.screenHeight*0.05,),
            // sign in button
            Container(
              width: Dimensions.screenWidth/2,
              height: Dimensions.screenHeight/13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: AppColors.mainColor,
              ),
              child: Center(
                child: BigText(
                  text: AppConstants.SiGN_IN,
                  size: Dimensions.font20+Dimensions.font20/2,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: Dimensions.screenHeight*0.05,),

            // tap to go to sign in page
            RichText(
                text: TextSpan(
                  text: "Don\'t have an account? ",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: Dimensions.font16,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()..onTap=()=>Get.to(()=>SignUpPage(), transition: Transition.fade),
                      text: " Create",
                      style: TextStyle(
                        color: AppColors.mainBlackColor,
                        fontSize: Dimensions.font16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
}
