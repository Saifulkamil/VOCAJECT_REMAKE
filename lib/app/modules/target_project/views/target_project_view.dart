import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/fungsi_widget_random.dart';
import '../../../utils/colors.dart';
import '../../../utils/component/widget_success.dart';
import '../../../utils/component/widget_target_project.dart';
import '../../../utils/string.dart';
import '../controllers/target_project_controller.dart';

class TargetProjectView extends GetView<TargetProjectController> {
  const TargetProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final flowC = Get.put(WidgetController());
    final projectC = Get.find<TargetProjectController>();

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: colorTransparan,
          elevation: 0,
          title: Text(Target_Proyek,
              style: ColorApp.secondColorTextStyly(context)
                  .copyWith(fontSize: 20, fontWeight: semiBold)),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.secondary,
              )),
          actions: [
            // ignore: unrelated_type_equality_checks
            projectC.userdata != "student"
                ? Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            builder: (BuildContext context) {
                              return WidgetTargetProject(
                                onPressed: () {
                                  controller.createTargetProject(
                                      controller.titleTask.text);
                                  flowC.Loading();

                                  Timer(const Duration(milliseconds: 1500), () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      builder: (BuildContext context) {
                                        return WidgetSuccess(
                                          text:
                                              Kamu_Berhasil_Membuat_Mimpi_baru,
                                          onPressed: () {
                                            Get.back();
                                            Get.back();
                                            Get.back();
                                          },
                                        );
                                      },
                                    );
                                  });
                                  controller.isProjectLoaded.value = false;
                                },
                                teks: Target_Proyek,
                                teksEditing: "",
                                task: projectC,
                                flowC: flowC,
                                teskButom: simpan,
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.add,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 35,
                        )),
                  )
                : const Center()
          ],
        ),
        body: GetX<TargetProjectController>(builder: (controller) {
          if (!controller.isProjectLoaded.value) {
            // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
            return const Center(child: CircularProgressIndicator());
          } else {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Text("${controller.projectData!.title}",
                        textAlign: TextAlign.center,
                        style: ColorApp.secondColorTextStyly(context)
                            .copyWith(fontSize: 20, fontWeight: reguler)),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final project = controller.listProjectTask[
                        controller.listProjectTask.length - index - 1];
                    bool role =
                        true; // Menggunakan tipe data bool, karena sudah dicek apakah null atau tidak

                    if (projectC.userdata == "student") {
                      print(controller.userdata);
                      role = !role;
                    }
                    controller.userdata != "studeny";
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            colorScheme:
                                const ColorScheme.light(primary: greenColor)),
                        child: GestureDetector(
                          onHorizontalDragStart: (test) {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              builder: (BuildContext context) {
                                return WidgetTargetProject(
                                  onPressed: () {
                                    controller.deleteTargetProject(
                                      controller.titleTask.text,
                                      project.id,
                                    );

                                    if (controller.isProjectLoaded.value) {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        builder: (BuildContext context) {
                                          return WidgetSuccess(
                                            text: Kamu_Berhasil_Hapus_Mimpi_,
                                            onPressed: () {
                                              Get.back();
                                              Get.back();
                                            },
                                          );
                                        },
                                      );
                                    } else {
                                      CircularProgressIndicator();
                                    }
                                    controller.isProjectLoaded.value = false;
                                  },
                                  teks: "Hapus Target",
                                  teksEditing: project.title,
                                  teskButom: "Hapus",
                                  task: projectC,
                                  flowC: flowC,
                                );
                              },
                            );
                          },
                          onLongPress: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              builder: (BuildContext context) {
                                return WidgetTargetProject(
                                  onPressed: () {
                                    controller.updateTargetProject(
                                      controller.titleTask.text,
                                      project.id,
                                    );

                                    if (controller.isProjectLoaded.value) {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        builder: (BuildContext context) {
                                          return WidgetSuccess(
                                            text: Kamu_Berhasil_Merubah_Mimpi_,
                                            onPressed: () {
                                              Get.back();
                                              Get.back();
                                            },
                                          );
                                        },
                                      );
                                    } else {
                                      CircularProgressIndicator();
                                    }
                                    controller.isProjectLoaded.value = false;
                                  },
                                  teks: "Update Target",
                                  teksEditing: project.title,
                                  teskButom: "Ubah",
                                  task: projectC,
                                  flowC: flowC,
                                );
                              },
                            );
                          },
                          child: CheckboxListTile(
                            enabled: role,
                            title: Text("${project.title}",
                                style: ColorApp.secondColorTextStyly(context)
                                    .copyWith(
                                        fontSize: 16, fontWeight: reguler)),
                            checkColor:
                                Theme.of(context).colorScheme.background,
                            // fillColor: MaterialStatePropertyAll(greenColor),
                            value: project.checked,

                            onChanged: (value) async {
                              controller.updateTodoStatus(project.id, value!);

                              if (controller.isProjectLoaded.value &&
                                  !project.checked) {
                                showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  builder: (BuildContext context) {
                                    return WidgetSuccess(
                                      text: Kamu_Berhasil_unlock_skill,
                                      onPressed: () {
                                        Get.back();
                                      },
                                    );
                                  },
                                );
                              } else {
                                CircularProgressIndicator();
                              }
                              controller.isProjectLoaded.value = false;
                            },
                          ),
                        ),
                      ),
                    );
                  }, childCount: controller.listProjectTask.length),
                )
              ],
            );
          }
        }));
  }
}
