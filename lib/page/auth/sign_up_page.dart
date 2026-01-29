import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_file.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/app_constants.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = [
      "t.png",
      "f.png",
      "g.png",
    ];
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
               //email field
               AppTextFile(icon: Icons.email, textEditingController: emailController, hintText: "Email",),
               SizedBox(height: Dimensions.height20,),
               // password field
               AppTextFile(icon: Icons.password_sharp, textEditingController: passwordController, hintText: "Password",),
               SizedBox(height: Dimensions.height20,),
               // name field
               AppTextFile(icon: Icons.person, textEditingController: nameController, hintText: "Name",),
               SizedBox(height: Dimensions.height20,),
               // phone field
               AppTextFile(icon: Icons.phone, textEditingController: phoneController, hintText: "Phone",),
               SizedBox(height: Dimensions.height20,),
                // sign up button
               Container(
                 width: Dimensions.screenWidth/2,
                 height: Dimensions.screenHeight/13,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(Dimensions.radius30),
                   color: AppColors.mainColor,
                 ),
                 child: Center(
                   child: BigText(
                     text: AppConstants.SiGN_UP,
                     size: Dimensions.font20+Dimensions.font20/2,
                     color: Colors.white,
                   ),
                 ),
               ),
              SizedBox(height: Dimensions.height10,),
              // tap to go to sign in page
              RichText(
                  text: TextSpan(
                    recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                    text: "Have an account already? ",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font16,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()..onTap=()=>Get.back(),
                        text: "Sign In",
                        style: TextStyle(
                          color: AppColors.mainBlackColor,
                          fontSize: Dimensions.font16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(height: Dimensions.screenHeight*0.05,),
              RichText(
                  text: TextSpan(
                    text: "Sign up using one of the following methods",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font16,
                    ),
                  ),
              ),
              Wrap(
                children: List.generate(3, (index) => Padding(
                  padding: EdgeInsets.all(Dimensions.height10),
                  child: CircleAvatar(
                    radius: Dimensions.radius30,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      "assets/image/"+signUpImages[index],
                    ),
                  ),
                ))
              ),
            ],
          ),
        ),
    );
  }
}
