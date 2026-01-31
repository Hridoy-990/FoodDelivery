import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

void showCustomSnackBar(String message, {bool isError = true, String title = "Error"}) {
  Get.snackbar(
    title,
    message,
    titleText: BigText(text: title, color: Colors.white,),
    messageText: Text(
      message,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: Colors.redAccent,
    colorText: Colors.white,
    snackPosition: SnackPosition.TOP,
    margin: EdgeInsets.all(15),
    borderRadius: 10,
    duration: Duration(seconds: 3),
    icon: Icon(Icons.error, color: Colors.white),
  );
}