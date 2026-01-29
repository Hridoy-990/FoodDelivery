import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/account_widget.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        title: BigText(
            text: "Profile",
            size: 24,
            color: Colors.white
        ),
      ),
      body: Container(
        width: double.maxFinite,
        margin: EdgeInsets.only(top: Dimensions.height20),
        child: Column(
          children: [
            AppIcon(icon: Icons.person,
                backgroundColor: AppColors.mainColor,
                iconColor: Colors.white,
                iconSize: Dimensions.height15 * 5,
                size: Dimensions.height15 * 10
            ),
            SizedBox(height: Dimensions.height30,),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    AccountWidget(appIcon: AppIcon(
                        icon: Icons.person,
                        backgroundColor: AppColors.mainColor,
                        iconColor: Colors.white,
                        iconSize: (Dimensions.height10 * 5) / 2,
                        size: Dimensions.height10 * 10
                    ), bigText: BigText(text: "Hridoy")),
                    SizedBox(height: Dimensions.height20,),
                    AccountWidget(appIcon: AppIcon(
                        icon: Icons.phone,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: (Dimensions.height10 * 5) / 2,
                        size: Dimensions.height10 * 10
                    ), bigText: BigText(text: "+123 456 7890")),
                    SizedBox(height: Dimensions.height20,),
                    AccountWidget(appIcon: AppIcon(
                        icon: Icons.email,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: (Dimensions.height10 * 5) / 2,
                        size: Dimensions.height10 * 10
                    ), bigText: BigText(text: "abc@gmail.com")),
                    SizedBox(height: Dimensions.height20,),
                    AccountWidget(appIcon: AppIcon(
                        icon: Icons.location_on,
                        backgroundColor: AppColors.yellowColor,
                        iconColor: Colors.white,
                        iconSize: (Dimensions.height10 * 5) / 2,
                        size: Dimensions.height10 * 10
                    ), bigText: BigText(text: "Fill in your address")),
                    SizedBox(height: Dimensions.height20,),
                    AccountWidget(appIcon: AppIcon(
                        icon: Icons.message_outlined,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: (Dimensions.height10 * 5) / 2,
                        size: Dimensions.height10 * 10
                    ), bigText: BigText(text: "Hridoy")),
                    SizedBox(height: Dimensions.height20,),
                    AccountWidget(appIcon: AppIcon(
                        icon: Icons.logout,
                        backgroundColor: Colors.redAccent,
                        iconColor: Colors.white,
                        iconSize: (Dimensions.height10 * 5) / 2,
                        size: Dimensions.height10 * 10
                    ), bigText: BigText(text: "Log Out")),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
