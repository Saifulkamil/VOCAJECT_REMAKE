import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/Models/UserModel.dart';
// import 'package:vocaject_remake_v1/app/Models/UserDataResponse.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';
import 'package:http/http.dart' as http;

import '../utils/baseUrl.dart';

class AuthController extends GetxController {

  // ignore: non_constant_identifier_names
  void Loading() {
    Get.defaultDialog(
      title: "Proses...",
      radius: 7,
      content: const Center(
          child: CircularProgressIndicator(
        color: greenColor,
      )),
    );
  }

  // Fungsi untuk melakukan proses login dan mendapatkan UserModel
  Future<UserModel?> login(String email, String pass) async {
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
          final userdata = UserModel.fromJson(data);

          return userdata;
        } else {
          // Jika 'data' atau 'support' tidak ada, return null
          // return null;
        }
      } else {
        // Jika status code bukan 200, bisa jadi terjadi kesalahan pada server
        print("Error: ${response.reasonPhrase}");
        // return null; // Return null jika terjadi kesalahan
      }
    } catch (e) {
      // Tangkap dan print error jika ada kesalahan dalam proses request
      print("Error catch $e");
      // return null; // Return null jika terjadi kesalahan
    }
  }
}
