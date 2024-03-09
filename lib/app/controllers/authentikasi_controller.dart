import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vocaject_remake_v1/app/Models/UserModel.dart';
// import 'package:vocaject_remake_v1/app/Models/UserDataResponse.dart';
import 'package:http/http.dart' as http;

import '../utils/baseUrl.dart';
import 'fungsi_widget_random.dart';

class AuthController extends GetxController {
  final widgetController = WidgetController();
  final user = GetStorage();

// Fungsi untuk menyimpan UserModel ke GetStorage
  void saveUserToStorage(UserModel userModel) {
    // Simpan UserModel ke GetStorage dengan kunci tertentu, misalnya "user"
    user.write('user', userModel.toJson());
  }

  UserModel? getUserFromStorage() {
    // Baca UserModel dari GetStorage dengan kunci yang sesuai, misalnya "user"
    final userJson = user.read('user');
    if (userJson != null) {
      // Jika UserModel ditemukan, deserialisasi JSON menjadi UserModel

      return UserModel.fromJson(userJson);
    }
    return null; // Return null jika UserModel tidak ditemukan
  }

  // ignore: non_constant_identifier_names

  // Fungsi untuk melakukan proses login dan mendapatkan UserModel
  Future<UserModel?> login(String email, String pass) async {
    widgetController.loading(Get.overlayContext!);
    // URL endpoint untuk proses login
    Uri url = Uri.parse("${UrlDomain.baseurl}/api/auth/login");
    try {
      // Melakukan HTTP POST request untuk login
      final response = await http.post(
        url,
        body: {
          "email": email,
          "password": pass,
        },
      );
      // Decode JSON string menjadi Map
      Map<String, dynamic> data = json.decode(response.body);
      // print(data["data"]["user"]["college"]);
      // Memeriksa status code response dari server
      if (response.statusCode == 200) {
        // Pengecekan keberadaan kunci 'message' dan 'data'
        if (data.containsKey('message') && data.containsKey('data')) {
          // Deserialisasi JSON menjadi objek UserModel
          final userdata = UserModel.fromJson(data);
          // print(userdata.data.user.college.id);
          if (kDebugMode) {
            print("Error: $userdata");
          }
          // Simpan UserModel ke GetStorage-=0
          saveUserToStorage(userdata);

          return userdata;
        } else {
          // Jika 'data' atau 'support' tidak ada, return null
          return null;
        }
      } else {
        // Jika status code bukan 200, bisa jadi terjadi kesalahan pada server
        if (kDebugMode) {
          print("Error: ${response.reasonPhrase}");
        }
        return null; // Return null jika terjadi kesalahan
      }
    } catch (e) {
      // Tangkap dan print error jika ada kesalahan dalam proses request
      if (kDebugMode) {
        print("Error catch $e");
      }
      return null; // Return null jika terjadi kesalahan
    }
  }
}
