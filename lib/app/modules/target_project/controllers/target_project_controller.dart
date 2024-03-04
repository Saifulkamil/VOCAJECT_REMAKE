import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectTaskDetail.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectTaskModel.dart';
import 'package:http/http.dart' as http;

import '../../../Models/ProjectData.dart';
import '../../../Models/UserModel.dart';
import '../../../utils/baseUrl.dart';

class TargetProjectController extends GetxController {
  ProjectData? projectData;
  ProjectTaskModel? ProjectTaskDatas;
  ProjectTaskDetail? ProjectTaskData;
  List<dynamic> listProjectTask = [].obs;
  final TextEditingController titleTask = TextEditingController();

  // ProjectModelSingle ProjectSil
  UserModel? userdata;

  // final user = GetStorage();
  final user = GetStorage();

  var isProjectLoaded = false.obs;
  var isProjectcreate = false.obs;

  @override
  void onInit() {
    super.onInit();
    projectData = Get.arguments;
    getProjectTask();
  }

  UserModel? getUserFromStorage() {
    // Baca UserModel dari GetStorage dengan kunci yang sesuai, misalnya "user"
    final userJson = user.read('user');

    // Jika UserModel ditemukan, deserialisasi JSON menjadi UserModel
    if (userJson != null) {
      userdata = UserModel.fromJson(userJson);
      // print(" ini id user ${userdata!.data.user.id}");

      return userdata;
    }
    return null; // Return null jika UserModel tidak ditemukan
  }

  Future<ProjectTaskModel?> getProjectTask() async {
    Uri url =
        Uri.parse("${UrlDomain.baseurl}/api/project/${projectData!.id}/task");

    try {
      final response = await http.get(url);
      Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        // Pengecekan keberadaan kunci 'message' dan 'data'
        if (data.containsKey('message') && data.containsKey('data')) {
          // Deserialisasi JSON menjadi objek UserModel
          ProjectTaskDatas = ProjectTaskModel.fromJson(data);
          listProjectTask = ProjectTaskDatas!.data;
          isProjectLoaded.value = true;
          return ProjectTaskDatas;
        } else {
          // Jika 'data' atau 'support' tidak ada, return null
          return null;
        }
      } else {
        // Jika status code bukan 200, bisa jadi terjadi kesalahan pada server
        print("Error: ${response.reasonPhrase}");
        return null; // Return null jika terjadi kesalahan
      }
    } catch (err) {
      print(" ini error ngak muncul project  ${err}");
      // return List<Project>.empty();
    }
    return null;

    // Memeriksa status code response dari server
  }

  void createTargetProject(String toDo) async {
    Uri url =
        Uri.parse("${UrlDomain.baseurl}/api/project/${projectData!.id}/task");
    try {
      final response = await http.post(
        url,
        body: {"title": toDo},
      );
      Map<String, dynamic> data = json.decode(response.body);

      if (response.statusCode == 200) {
        ProjectTaskDetail newTask = ProjectTaskDetail.fromJson(data['data']);
        listProjectTask.add(newTask);
        Timer(const Duration(milliseconds: 2000), () {
          isProjectLoaded.value = true;
        });
      } else {
        // Jika status code bukan 200, bisa jadi terjadi kesalahan pada server
        print("Error: ${response.reasonPhrase}");
      }
    } catch (e) {
      print(e);
    }
  }

  void updateTodoStatus(int todoId, bool newStatus) async {
    Uri url = Uri.parse(
      "${UrlDomain.baseurl}/api/project/${projectData!.id}/task/$todoId/switch",
    );

    try {
      final response = await http.post(
        url,
        body: {"checked": newStatus.toString()},
      );
      Map<String, dynamic> data = json.decode(response.body);
      if (response.statusCode == 200) {
        listProjectTask.map((todo) {
          if (todo.id == todoId) {
            todo.checked = newStatus;
            // Timer(const Duration(milliseconds: 2000), () {
            isProjectLoaded.value = true;
            // });
          }
          return todo;
        }).toList();
        update();
      }
    } catch (e) {
      print("Gagal memperbarui status tugas di API: $e");
    }
  }

  void updateTargetProject(String title, int todoId) async {
    Uri url = Uri.parse(
      "${UrlDomain.baseurl}/api/project/${projectData!.id}/task/$todoId",
    );

    try {
      final response = await http.post(
        url,
        body: {"title": title},
      );
      Map<String, dynamic> data = json.decode(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        listProjectTask.map((todo) {
          if (todo.id == todoId) {
            print(todo.title);
            todo.title = title;
            // Timer(const Duration(milliseconds: 2000), () {
            isProjectLoaded.value = true;
            // });
          }
          return todo;
        }).toList();
        update();
      } else {
        // Jika status code bukan 200, bisa jadi terjadi kesalahan pada server
        print("Error: ${response.reasonPhrase}");
      }
    } catch (e) {
      print(e);
    }
  }

  void deleteTargetProject(String title, int todoId) async {
    Uri url = Uri.parse(
      "${UrlDomain.baseurl}/api/project/${projectData!.id}/task/$todoId",
    );

    try {
      final response = await http.delete(
        url,
      );
      Map<String, dynamic> data = json.decode(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        for (int i = 0; i < listProjectTask.length; i++) {
          var todo = listProjectTask[i];
          if (todo.id == todoId) {
            print(todo.title);
            listProjectTask.removeAt(i); // Hapus todo jika id cocok
            break; // Keluar dari perulangan setelah menghapus todo
          }
        }
        isProjectLoaded.value = true;
        update();
      } else {
        // Jika status code bukan 200, bisa jadi terjadi kesalahan pada server
        print("Error: ${response.reasonPhrase}");
      }
    } catch (e) {
      print(e);
    }
  }
}
