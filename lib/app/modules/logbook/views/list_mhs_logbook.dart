import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/Models/MahasiswaDetails.dart';
import 'package:vocaject_remake_v1/app/utils/component/widget_appbar.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/colors.dart';
import '../controllers/list_mhs_logbook_controller_.dart';

class ListMhsLogbook extends GetView<ListMhsLogbookController> {
  const ListMhsLogbook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const AppbarTransparant(title: daftar_mahasiswa),
        body: GetX<ListMhsLogbookController>(builder: (controller) {
          if (!controller.isProjectLoaded.value) {
            // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
            return const Center(child: CircularProgressIndicator());
          } else {
            return CustomScrollView(slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  MahasiswaDetails listmahasiswa =
                      controller.projectData!.members[index];
                  // print("ini id project ${controller.projectId}");
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Get.toNamed(Routes.LOGBOOK, arguments: {
                                        "idMhs": listmahasiswa.id,
                                        "idProject": controller.projectData!.id
                                      });
                                    },
                                    leading: CircleAvatar(
                                      backgroundColor: greyColor,
                                      backgroundImage: NetworkImage(
                                          "${listmahasiswa.picture}"),
                                    ),
                                    title: Text("${listmahasiswa.name}"),
                                    subtitle: Text("${listmahasiswa.nim}"),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]));
                }, childCount: controller.projectData!.members.length),
              )
            ]);
          }
        }));
  }
}
