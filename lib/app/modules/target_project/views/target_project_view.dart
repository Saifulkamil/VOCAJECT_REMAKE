import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/fungsi_widget_random.dart';
import '../../../utils/colors.dart';
import '../../../utils/component/widget_target_project.dart';
import '../../../utils/string.dart';
import '../controllers/target_project_controller.dart';

class TargetProjectView extends GetView<TargetProjectController> {
  const TargetProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final flowC = Get.put(WidgetController());

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
            Padding(
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
                          flowC: flowC,
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
                            .copyWith(fontSize: 16, fontWeight: semiBold)),
                  ),
                ),
                SliverPrototypeExtentList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      final project = controller.listProjectTask[index];


                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Theme(
                          data: Theme.of(context).copyWith(
                              colorScheme:
                                  const ColorScheme.light(primary: greenColor)),
                          child: CheckboxListTile(
                            enabled: true,
                            title: Text("${project.title }",
                                style: ColorApp.secondColorTextStyly(context)
                                    .copyWith(
                                        fontSize: 15, fontWeight: reguler)),
                            checkColor:
                                Theme.of(context).colorScheme.background,
                            // fillColor: MaterialStatePropertyAll(greenColor),
                            value: project.checked,

                            onChanged: (value) {},
                          ),
                        ),
                      );
                    }, childCount: controller.ProjectTaskData!.data.length),
                    prototypeItem: CheckboxListTile(
                      enabled: false,
                      title: Text("",),
                      value: false,
                      onChanged: (value) {},
                    ))
              ],
            );
          }
        }));
  }
}
