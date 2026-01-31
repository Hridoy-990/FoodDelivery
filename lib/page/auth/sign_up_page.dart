import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/base/custom_loader.dart';
import 'package:food_delivery/controllers/auth_controller.dart';
import 'package:food_delivery/models/sign_up_body_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_text_file.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../base/show_custom_snackbar.dart';
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

    void _registration(AuthController authController) {
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();

      // Regex patterns
      final phoneRegex = RegExp(r'^[+]?[(]?[0-9]{1,4}[)]?[-\s.]?[(]?[0-9]{1,4}[)]?[-\s.]?[0-9]{1,9}$');
      final hasUpperCase = RegExp(r'[A-Z]');
      final hasLowerCase = RegExp(r'[a-z]');
      final hasDigits = RegExp(r'[0-9]');

      if (email.isEmpty) {
        showCustomSnackBar(
            "Type in your email address", title: "Email address");
      } else if (!GetUtils.isEmail(email)) {
        showCustomSnackBar(
            "Type in a valid email address", title: "Valid email address");
      } else if (password.isEmpty) {
        showCustomSnackBar("Type in your password", title: "Password");
      } else if (password.length < 6) {
        showCustomSnackBar(
            "Password can not be less than six characters", title: "Password");
      }else if (!hasUpperCase.hasMatch(password)) {
        showCustomSnackBar(
            "Password must contain at least one uppercase letter",
            title: "Password");
      } else if (!hasLowerCase.hasMatch(password)) {
        showCustomSnackBar(
            "Password must contain at least one lowercase letter",
            title: "Password");
      } else if (!hasDigits.hasMatch(password)) {
        showCustomSnackBar(
            "Password must contain at least one number",
            title: "Password");
      } else if (name.isEmpty) {
        showCustomSnackBar("Type in your name", title: "Name");
      } else if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone number");
      }else if (phone.isEmpty) {
        showCustomSnackBar("Type in your phone number", title: "Phone number");
      } else if (!phoneRegex.hasMatch(phone)) {
        showCustomSnackBar(
            "Type in a valid phone number", title: "Valid phone number");
      } else {
        // everything is fine
        SignUpBody signUpBody = SignUpBody(
          name: name,
          phone: phone,
          email: email,
          password: password,
        );
        authController.registration(signUpBody).then((status) {;
          if (status.isSuccess) {
            print("success registration");
            //Get.toNamed(RouteHelper.getInitial());
          } else {
            showCustomSnackBar(status.message);
          }
        });
        print(signUpBody.toString());
      }
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder <AuthController>(builder: (_authController){
        return !_authController.isLoading?SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: Dimensions.screenHeight * 0.05,),
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
              AppTextFile(icon: Icons.email,
                textEditingController: emailController,
                hintText: "Email",),
              SizedBox(height: Dimensions.height20,),
              // password field
              AppTextFile(icon: Icons.password_sharp,
                textEditingController: passwordController,
                hintText: "Password", isObscure: true),
              SizedBox(height: Dimensions.height20,),
              // name field
              AppTextFile(icon: Icons.person,
                textEditingController: nameController,
                hintText: "Name",),
              SizedBox(height: Dimensions.height20,),
              // phone field
              AppTextFile(icon: Icons.phone,
                textEditingController: phoneController,
                hintText: "Phone",),
              SizedBox(height: Dimensions.height20,),
              // sign up button
              GestureDetector(
                onTap: () {
                  _registration(_authController);
                },
                child: Container(
                  width: Dimensions.screenWidth / 2,
                  height: Dimensions.screenHeight / 13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    color: AppColors.mainColor,
                  ),
                  child: Center(
                    child: BigText(
                      text: AppConstants.SiGN_UP,
                      size: Dimensions.font20 + Dimensions.font20 / 2,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height10,),
              // tap to go to sign in page
              RichText(
                  text: TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.back(),
                    text: "Have an account already? ",
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: Dimensions.font16,
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
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
              SizedBox(height: Dimensions.screenHeight * 0.05,),
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
                  children: List.generate(3, (index) =>
                      Padding(
                        padding: EdgeInsets.all(Dimensions.height10),
                        child: CircleAvatar(
                          radius: Dimensions.radius30,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                            "assets/image/" + signUpImages[index],
                          ),
                        ),
                      ))
              ),
            ],
          ),
        ): CustomLoader();
      })
    );
  }
}
