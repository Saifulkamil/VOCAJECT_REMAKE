import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/Models/UserModel.dart';

class EditProfileController extends GetxController {
  UserModel? dataProfil;
  var isProjectLoaded = false.obs;
  String? name;
  String? alamat;
  String? phone;
  late TextEditingController nameC;
  late TextEditingController phoneC;
  late TextEditingController alamatC;

  @override
  void onInit() {
    super.onInit();
    dataProfil = Get.arguments;
    if (dataProfil != null) {
      isProjectLoaded.value = true;
      name = dataProfil!.data.user.name;
      phone = dataProfil!.data.user.phone;
      alamat = dataProfil!.data.user.address;
      nameC = TextEditingController(text: name);
      phoneC = TextEditingController(text: phone);
      alamatC = TextEditingController(text: alamat);
    } else {
      print("kosong");
    }
  }
}
