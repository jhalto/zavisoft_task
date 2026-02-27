import 'package:get/instance_manager.dart';
import 'package:zavisoft_task/feature/splash/controllers/splash_controller.dart';

class SplashBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => SplashController() ,fenix: true);
  }
}