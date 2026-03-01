import 'package:get/get.dart';
import 'package:zavisoft_task/feature/home/controllers/home_controller.dart';
import 'package:zavisoft_task/feature/navbar/controllers/nav_bar_controller.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<NavBarController>(NavBarController(), permanent: true);
    Get.put<HomeController>(HomeController(), permanent: true);
    
  }
}
