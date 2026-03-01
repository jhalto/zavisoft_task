
import 'package:get/get.dart';
import 'package:zavisoft_task/feature/auth/bindings/auth_bindings.dart';
import 'package:zavisoft_task/feature/auth/views/login_view.dart';
import 'package:zavisoft_task/feature/navbar/bindings/nav_bar_binding.dart';
import 'package:zavisoft_task/feature/navbar/views/nav_bar_view.dart';
import 'package:zavisoft_task/feature/splash/bindings/splash_bindings.dart';
import 'package:zavisoft_task/feature/splash/views/splash_view.dart';
import 'package:zavisoft_task/route/app_routes.dart';


class AppPages {
  static String initial = Routes.login;
  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      binding: SplashBindings(),
      // customTransition: SmoothSlideTransition(isAndroid: GetPlatform.isAndroid),
      transitionDuration: const Duration(milliseconds: 0),
     
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: AuthBindings(),
      // customTransition: SmoothSlideTransition(isAndroid: GetPlatform.isAndroid),
      transitionDuration: const Duration(milliseconds: 0),
     
    ),
    GetPage(
      name: Routes.navbar,
      page: () => const NavBarView(),
      binding: NavBarBinding(),
      // customTransition: SmoothSlideTransition(isAndroid: GetPlatform.isAndroid),
      transitionDuration: const Duration(milliseconds: 0),
     
    ),
    //  GetPage(
    //   name: Routes.dashboard,
    //   page: () => const DashboardView(),
    //   binding: DashboardBindings(),
    //   customTransition: SmoothSlideTransition(isAndroid: GetPlatform.isAndroid),
    //   transitionDuration: const Duration(milliseconds: 300),
    // ),
    //  GetPage(
    //   name: Routes.dataview,
    //   page: () =>  DataView(),
    //   binding: DataViewBindings(),
    //   customTransition: SmoothSlideTransition(isAndroid: GetPlatform.isAndroid),
    //   transitionDuration: const Duration(milliseconds: 300),
    // ),

   
  ];
}
