import 'package:get/instance_manager.dart';
import 'package:zavisoft_task/feature/auth/controllers/auth_controller.dart';

class AuthBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController(),);
  }
}