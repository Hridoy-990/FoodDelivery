import 'package:flutter/cupertino.dart' show Placeholder, BuildContext, StatelessWidget, Widget, Container;
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/app_icon.dart';
import 'package:food_delivery/widgets/big_text.dart';

class AccountWidget extends StatelessWidget {
  final AppIcon appIcon;
  final BigText bigText;
  AccountWidget({super.key, required this.appIcon, required this.bigText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimensions.width20,
          top: Dimensions.height10,
          bottom: Dimensions.height10
      ),
      child: Row(
        children: [
          appIcon,
          SizedBox(width: Dimensions.width20),
          bigText
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,  // Moved color here
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 1,
              color: Colors.grey.withValues(alpha: 0.2)
          ),
        ],
      ),
    );
  }
}