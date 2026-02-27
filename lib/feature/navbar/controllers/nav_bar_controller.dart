
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zavisoft_task/feature/home/views/home_view.dart';

class NavBarController extends GetxController {

  RxInt selectedIndex = 0.obs;
  String? date;
  @override
  onInit(){
    super.onInit();
  
    selectedIndex.value = 0;

  }
  List<Widget> pages = <Widget>[
    HomeView(),
    Center(child: Text("Browse"),),
    Center(child: Text("Favorite"),),
    Center(child: Text("Menu"),),
  
    
  ];

  void onPageChanged(int index) {
    selectedIndex.value = index;
    // pageController.jumpToPage(index);
  }

  void onItemTapped(int index) {
    selectedIndex.value = index;
    // navpageController.jumpToPage(index);
  }

  
}
