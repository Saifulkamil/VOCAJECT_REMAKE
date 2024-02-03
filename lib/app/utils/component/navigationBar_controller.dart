// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigationBarController extends GetxController {
  var tabIdex = 0.obs;
  void changeTabIndex(int index) {
    tabIdex.value = index;
    update();
  }
  bottombarItem(IconData icon, String label){
  return BottomNavigationBarItem(icon: Icon(icon), label: label );
} 
}
