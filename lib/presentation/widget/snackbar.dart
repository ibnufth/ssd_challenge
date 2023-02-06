import 'package:flutter/material.dart';
import 'package:get/get.dart';

showWarningSnackbar(String message) => Get.showSnackbar(
      GetSnackBar(
        message: message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange,
        borderRadius: 20,
        margin: EdgeInsets.all(15),
        duration: Duration(seconds: 4),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
      ),
    );
