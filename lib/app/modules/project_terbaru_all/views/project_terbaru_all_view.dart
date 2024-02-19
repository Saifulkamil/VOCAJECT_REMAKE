import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/component/widget_appbar.dart';
import '../../../utils/component/widget_poject_terbaru.dart';
import '../../home/controllers/home_controller.dart';
import '../controllers/project_terbaru_all_controller.dart';

class ProjectTerbaruAllView extends GetView<ProjectTerbaruAllController> {
  const ProjectTerbaruAllView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppbarTransparant(title: Proyek_terbaru),
        body: GetX<HomeController>(builder: (controller) {
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
