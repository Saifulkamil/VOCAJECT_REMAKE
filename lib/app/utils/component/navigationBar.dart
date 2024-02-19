// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:vocaject_remake_v1/app/modules/project_history/views/project_history_vmhs_view.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';
import '../../modules/home/controllers/home_controller.dart';
import '../../modules/home/views/home_view.dart';
import '../../modules/profile/controllers/profile_controller.dart';
import '../../modules/profile/views/profile_view.dart';
import '../../modules/project_history/controllers/project_history_controller.dart';
import '../../modules/project_history/views/project_history_college_view.dart';
import '../colors.dart';
import 'navigationBar_controller.dart';
import 'package:get/get.dart';

// class NavigationBar extends GetView<NavigationBarController> {
//   const NavigationBar({super.key});
//   @override
//   Widget build(BuildContext context) {
//      final navbarC = Get.put<NavigationBarController>(NavigationBarController());
//   // final profilC = Get.put<PageProfileController>(PageProfileController());
//   // final ProjectlistC = Get.put<PageProjectListController>(PageProjectListController());
//   // final homeC = Get.put<HomeController>(HomeController());
//     return GetBuilder<NavigationBarController>(builder: (context) {
//       return Scaffold(
//         backgroundColor: Theme.of(context).colorScheme.background,
//         body: IndexedStack(
//           index: navbarC.tabIdex,
//           children: const [HomeView(), ProjectHistoryView(), ProfileView()],
//         ),
//         bottomNavigationBar: ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(20.0),
//             topRight: Radius.circular(20.0),
//           ),
//           child: BottomNavigationBar(
//               type: BottomNavigationBarType.fixed,
//               backgroundColor: whiteColor,
//               elevation: 7,
//               currentIndex: navbarC.tabIdex,
//               selectedItemColor: greenColor,
//               unselectedItemColor: Colors.black,
//               onTap: navbarC.changeTabIndex,
//               items: [
//                 navbarC.bottombarItem(Icons.home, Beranda),
//                 navbarC.bottombarItem(Icons.list, Daftar_Project),
//                 navbarC.bottombarItem(Icons.person, Profil)
//               ]),
//         ),
//       );
//     });
//   }
// }

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navbarC = Get.put<NavigationBarController>(NavigationBarController());

    // Mendapatkan peran pengguna dari [NavigationBarController].
    final userRole = navbarC.getUserFromStorage();

    // Widget yang akan ditampilkan berdasarkan peran pengguna.
    Widget project;

    // Mapping peran pengguna dengan nama peran.
    final Map<String, String> role = {
      "college": "college",
      "company": "company",
      "lecture": "lecture",
      "student": "student"
    };

    // Memilih tampilan proyek berdasarkan peran pengguna.
    String? selectedRole = role[userRole!.data.user.role];
    if (selectedRole != "student") {
      
      // Jika peran pengguna bukan "student", tampilkan proyek collage.
      project = const ProjectHistoryCollegeView();
    } else {

      // Jika peran pengguna adalah "student", tampilkan proyek MSH (Mahasiswa).
      project = const ProjectHistoryMSHView();
    }

    Get.put(HomeController());

    Get.put(ProjectHistoryController());

    Get.put(ProfileController());

    final screen = [const HomeView(), project, const ProfileView()];

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
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: Beranda),
                BottomNavigationBarItem(icon: Icon(Icons.list), label: Riwayat),
                BottomNavigationBarItem(icon: Icon(Icons.people), label: Profil)
              ])),
    );
  }
}
