import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavisoft_task/core/const/urls.dart';
import 'package:zavisoft_task/core/helper/secure_storage_helper.dart';
import 'package:zavisoft_task/core/network/api_client.dart';
import 'package:zavisoft_task/core/network/api_handler.dart';
import 'package:zavisoft_task/feature/navbar/views/nav_bar_view.dart';
import 'package:zavisoft_task/route/app_routes.dart';

class AuthController extends GetxController {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final authFormKey = GlobalKey<FormState>();

  final RxBool isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;

    final body = {
      "username": userNameController.text.trim(),
      "password": passwordController.text.trim(),
    };

    try {
      final response = await ApiClient().dio.post(Urls.login, data: body);

      final result = ApiHandler.handleResponse(response);

      if (result["success"]) {
        print("Login Success: ${result["data"]}");
        await SecureStorageHelper.saveString('token', result['data']['token']);
        Get.toNamed(Routes.navbar);
        Get.snackbar("Success", "Login successful");
      }
    } on DioException catch (e) {
      final error = ApiHandler.handleError(e);

      Get.snackbar("Error", error["message"] ?? "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }
}
