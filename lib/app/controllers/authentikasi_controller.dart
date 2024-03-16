import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vocaject_remake_v1/app/Models/UserModel.dart';
// import 'package:vocaject_remake_v1/app/Models/UserDataResponse.dart';
import 'package:http/http.dart' as http;

import '../Models/CompanyDetail.dart';
import '../utils/baseUrl.dart';
import 'fungsi_widget_random.dart';

class AuthController extends GetxController {
  final widgetController = WidgetController();
  final user = GetStorage();

  UserModel? userdata;

  CompanyDetail? companyDetail;

// Fungsi untuk menyimpan UserModel ke GetStorage
  void saveUserToStorage(UserModel userModel) {
    // Simpan UserModel ke GetStorage dengan kunci tertentu, misalnya "user"
    user.write('user', userModel.toJson());
  }

  void saveUserToStorageCompanyDetails(CompanyDetail companyDetail) {
    // Simpan companyDetail ke GetStorage dengan kunci tertentu, misalnya "user"
    user.write('company', companyDetail.toJson());
  }

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

      // Memeriksa status code response dari server
      if (response.statusCode == 200) {
        // Pengecekan keberadaan kunci 'message' dan 'data'
        if (data.containsKey('message') && data.containsKey('data')) {
          // Deserialisasi JSON menjadi objek UserModel
          userdata = UserModel.fromJson(data);

          // Simpan UserModel ke GetStorage-=0
          saveUserToStorage(userdata!);
          if (userdata!.data.user.role == "lecture") {
          userDetails();
          }
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

  Future<void> userDetails() async {
    Uri url = Uri.parse("${UrlDomain.baseurl}/api/auth/me");

    try {
      final response = await http.get(url, headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${userdata!.data.access_token}',
      });
      Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        // Pengecekan keberadaan kunci 'message' dan 'data'
        if (data.containsKey('message') && data.containsKey('data')) {
          // Deserialisasi JSON menjadi objek UserModel
          companyDetail = CompanyDetail.fromJson(data["data"]["college"]);
          saveUserToStorageCompanyDetails(companyDetail!);
        } else {
          // Jika 'data' atau 'support' tidak ada, return null
          return;
        }
      } else {
        // Jika status code bukan 200, bisa jadi terjadi kesalahan pada server
        if (kDebugMode) {
          print("Error: ${response.reasonPhrase}");
        }
        return; // Return null jika terjadi kesalahan
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error catch me $e");
      }
      return;
    }
  }
}
