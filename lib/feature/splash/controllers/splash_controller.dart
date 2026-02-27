import 'package:get/get.dart';
import 'package:zavisoft_task/core/helper/secure_storage_helper.dart';
import 'package:zavisoft_task/route/app_routes.dart';

class SplashController extends GetxController {

   @override
     onInit(){
    isLogin();
    super.onInit();
  }

  Future<void> isLogin() async {
    
   await Future.delayed(Duration(seconds: 3));

    final token = await SecureStorageHelper.getString('token');

    if (token != null) {
      Get.offAllNamed(Routes.navbar);
    } else {
      Get.offAllNamed(Routes.login);
    }
  }
}
