import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/component/widget_appbar.dart';
import '../../../utils/component/widget_poject_terbaru.dart';
import '../controllers/projec_kategori_controller.dart';

class ProjecKategoriView extends GetView<ProjecKategoriController> {
  const ProjecKategoriView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final kategoriC = Get.find<ProjecKategoriController>();

    return Scaffold(
        appBar: AppbarTransparant(title: kategoriC.kategoriProject),
        body: GetX<ProjecKategoriController>(builder: (controller) {
          if (!controller.isProjectLoaded.value) {
            // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
            return const Center(child: CircularProgressIndicator());
          } else {
            return CustomScrollView(
              slivers: [
                SliverPrototypeExtentList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final project = controller.listProject[index];

                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15, bottom: 20),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.PROJECT_DETAILS,
                                arguments: project.id);
                          },
                          child: WidgetPojectTerbaru(
                            controller: project,
                          ),
                        ),
                      );
                    }, childCount: controller.listProject.length),
                    prototypeItem: const WidgetPojectTerbaruKosong())
              ],
            );
          }
        }));
  }
}
