// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Models/UserModel.dart';

class NavigationBarController extends GetxController {
  // Instance dari GetStorage untuk menyimpan data pengguna.
  final user = GetStorage();


  // fungsi untuk baca userModel dari GetStorage
  UserModel? getUserFromStorage() {

    // Baca UserModel dari GetStorage dengan kunci yang sesuai, misalnya "user"
    final userJson = user.read('user');

      // Jika UserModel ditemukan, deserialisasi JSON menjadi UserModel
    if (userJson != null) {
      return UserModel.fromJson(userJson);
    }
    return null; // Return null jika UserModel tidak ditemukan
  }

  var tabIdex = 0.obs;
  void changeTabIndex(int index) {
    tabIdex.value = index;
    update();
  }

  bottombarItem(IconData icon, String label) {
    return BottomNavigationBarItem(icon: Icon(icon), label: label);
  }
}
