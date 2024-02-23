// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vocaject_remake_v1/app/modules/anggota/controllers/anggota_controller.dart';
import 'package:vocaject_remake_v1/app/modules/anggota/views/anggota_view.dart';
import 'package:vocaject_remake_v1/app/modules/project_history/views/project_history_mhs_view.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';
import '../../modules/home/controllers/home_controller.dart';
import '../../modules/home/views/home_view.dart';
import '../../modules/profile/controllers/profile_controller.dart';
import '../../modules/profile/views/profile_view.dart';
import '../../modules/project_history/controllers/project_history_controller.dart';
import '../../modules/project_history/views/project_history_company_college_view.dart';
import '../../modules/project_history/views/project_history_dosen_view.dart';
import '../colors.dart';
import 'navigationBar_controller.dart';
import 'package:get/get.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navbarC = Get.put<NavigationBarController>(NavigationBarController());

    // Mendapatkan peran pengguna dari [NavigationBarController].
    final userRole = navbarC.getUserFromStorage();

    // Widget yang akan ditampilkan berdasarkan peran pengguna.
    Widget project;
    Widget? anggota;
    BottomNavigationBarItem? itemInNav;

    // Mapping peran pengguna dengan nama peran.
    final Map<String, String> role = {
      "college": "college",
      "company": "company",
      "lecture": "lecture",
      "student": "student"
    };

    // Memilih tampilan proyek berdasarkan peran pengguna.
    String? selectedRole = role[userRole!.data.user.role];
    if (selectedRole == "student") {
      // Jika peran pengguna bukan "student", tampilkan proyek collage.
      project = const ProjectHistoryMSHView();
      // print("ini navbar role${selectedRole}");
    } else if (selectedRole == "lecture") {
      // Jika peran pengguna adalah "student", tampilkan proyek MSH (Mahasiswa).
      project = const ProjectHistoryDosenView();
      // print("ini navbar role${selectedRole}");
    } else {
      project = const ProjectHistoryCompanyCollegeView();
      // print("ini navbar role${selectedRole}");
    }
    if (selectedRole == "college") {
      anggota = const AnggotaView();
    }

    if (selectedRole == "college") {
      itemInNav = const BottomNavigationBarItem(
          icon: Icon(Icons.people), label: "Anggota");
    }

    Get.put(HomeController());

    Get.put(ProjectHistoryController());
    if (selectedRole == "college") {
      Get.put(AnggotaController());
    }
    Get.put(ProfileController());

    final screen = [const HomeView(), project, 
    if(anggota != null) anggota,
    const ProfileView()];

    final item = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: Beranda),
      const BottomNavigationBarItem(icon: Icon(Icons.list), label: Riwayat),
      if (itemInNav != null) itemInNav,
      const BottomNavigationBarItem(icon: Icon(Icons.person), label: Profil)
    ];
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: navbarC.tabIdex.value,
            children: screen,
          )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
          selectedItemColor: greenColor,
          unselectedItemColor: greyColor,
          elevation: 7,
          onTap: (index) {
            navbarC.changeTabIndex(index);
          },
          currentIndex: navbarC.tabIdex.value,
          items: item)),
    );
  }
}
