import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackBarType { success, error }


void showCustomSnackBar(
  String message, {
  SnackBarType type = SnackBarType.error,
}) {
  Color bgColor;
  final String title = type == SnackBarType.success ? 'Success' : 'Error';

  switch (type) {
    case SnackBarType.success:
      bgColor = Colors.black87;
      break;
    case SnackBarType.error:
      bgColor = Colors.red;
      break;
  }
 
  Get.snackbar(
    '',
    '',
    backgroundColor: bgColor,
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.fromLTRB(10, 2, 10, 0),
    borderRadius: 10,
    duration: const Duration(seconds: 3),
    animationDuration: const Duration(milliseconds: 400),
    titleText: Text(
      title,
      style: const TextStyle(
        height: 1.2,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),
    messageText: Row(
      children: [
        Icon(
          type == SnackBarType.error?Icons.error_outline: Icons.done , color: Colors.white, size: 28,
        ),
       const SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style:const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

