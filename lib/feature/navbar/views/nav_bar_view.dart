
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavisoft_task/core/const/app_colors.dart';
import 'package:zavisoft_task/feature/navbar/controllers/nav_bar_controller.dart';

class NavBarView extends GetView<NavBarController> {
  const NavBarView({super.key});

  @override
  Widget build(BuildContext context) {
  //   assert(
  //     Get.isRegistered<NavBarController>(),
  //     "NavBarController is NOT registered!",
  //   );
  //  controller;
    return Scaffold(
      body: Obx(() => controller.pages[controller.selectedIndex.value]),
     
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15), // Soft and subtle
                offset: const Offset(0, -4), // ↓ Shadow goes down only
                blurRadius: 6, // Smoothen the shadow
                spreadRadius: 0,
              ),
            ],
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            )
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            children: [
              Expanded(
                child: Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.onItemTapped(0);
                    },
                    child: Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Icon(
                              Icons.home,
                              size: controller.selectedIndex.value == 0
                                  ? 28
                                  : 24,
                              color: controller.selectedIndex.value == 0
                                  ? AppColors.primaryColor
                                  : AppColors.secondaryTextColor,
                            ),
                          ),

                          const SizedBox(height: 4),
                          Text(
                           "Home",
                            style: TextStyle(
                              height: 1.2,
                              color: controller.selectedIndex.value == 0
                                  ? AppColors.primaryColor
                                  : AppColors.secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.onItemTapped(1);
                    },
                    child: Container(
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Icon(
                              CupertinoIcons.search,
                              size: controller.selectedIndex.value == 1
                                  ? 28
                                  : 24,
                              color: controller.selectedIndex.value == 1
                                  ? AppColors.primaryColor
                                  : AppColors.secondaryTextColor,
                            ),
                          ),

                          const SizedBox(height: 4),
                          Text(
                          "Browse",
                            style: TextStyle(
                              height: 1.2,
                              color: controller.selectedIndex.value == 1
                                  ? AppColors.primaryColor
                                  : AppColors.secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.onItemTapped(2);
                    },
                    child: Container(
                      height: 50,
                      color: Colors.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Icon(
                              Icons.favorite,
                              size: controller.selectedIndex.value == 2
                                  ? 28
                                  : 24,
                              color: controller.selectedIndex.value == 2
                                  ? AppColors.primaryColor
                                  : AppColors.secondaryTextColor,
                            ),
                          ),

                          const SizedBox(height: 4),
                          Text(
                            "Favorite",

                            style: TextStyle(
                              height: 1.2,
                              color: controller.selectedIndex.value == 2
                                  ? AppColors.primaryColor
                                  : AppColors.secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Obx(
                  () => GestureDetector(
                    onTap: () {
                      controller.onItemTapped(3);
                    },
                    child: Container(
                      height: 50,
                      color: Colors.transparent,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: Icon(
                              Icons.dashboard,
                              size: controller.selectedIndex.value == 3
                                  ? 28
                                  : 24,
                              color: controller.selectedIndex.value == 3
                                  ? AppColors.primaryColor
                                  : AppColors.secondaryTextColor,
                            ),
                          ),

                          const SizedBox(height: 4),
                          Text(
                            "Menu",
                            style: TextStyle(
                              height: 1.2,
                              color: controller.selectedIndex.value == 3
                                  ? AppColors.primaryColor
                                  : AppColors.secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
