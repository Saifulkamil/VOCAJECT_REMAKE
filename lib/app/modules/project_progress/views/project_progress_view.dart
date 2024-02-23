import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/colors.dart';
import '../../../utils/component/Widget_data_project.dart';
import '../../../utils/component/widget_card_btn_custom.dart';
import '../../../utils/component/widget_circular_progres.dart';
import '../../../utils/component/widget_datas_project.dart';
import '../../../utils/string.dart';
import '../controllers/project_progress_controller.dart';

class ProjectProgressView extends GetView<ProjectProgressController> {
  const ProjectProgressView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: colorTransparan,
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: GetX<ProjectProgressController>(builder: (controller) {
          
          if (!controller.isProjectLoaded.value) {
            // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
            return const Center(child: CircularProgressIndicator());
          } else {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 420,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            child: Image.asset(
                              Theme.of(context).brightness == Brightness.dark
                                  ? "assets/image/img_dark.png"
                                  : "assets/image/img_light.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              color: colorTransparan,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 15),
                                  child: Row(
                                    children: [
                                      Material(
                                        color: colorTransparan,
                                        child: InkWell(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Icon(
                                                Icons.arrow_back,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                            )),
                                      ),
                                      Text(
                                        "${controller.proposalData!.data.project.title}",
                                        style: ColorApp.secondColorTextStyly(
                                                context)
                                            .copyWith(
                                                fontSize: 20,
                                                fontWeight: semiBold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Align(
                              alignment: Alignment.topCenter,
                              child: CircularProgres(),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Text(
                              Progres_project,
                              style: ColorApp.secondColorTextStyly(context)
                                  .copyWith(fontSize: 18, fontWeight: semiBold),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            WidgetDataProject(controller: controller),
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    WidgetCardBtnCustom(
                                        text: Daftar_kerja,
                                        image:
                                            "assets/image/img_daftar_kerja.png",
                                        onPressed: () {
                                          // mengirim argument ke controler register
                                          Get.toNamed(
                                            Routes.TARGET_PROJECT,
                                          );
                                        }),
                                    WidgetCardBtnCustom(
                                        text: Konsultasi,
                                        image: "assets/image/img_chat.png",
                                        onPressed: () {
                                          Get.toNamed(Routes.KONSULTASI);
                                        }),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    WidgetCardBtnCustom(
                                        text: LogBook,
                                        image: "assets/image/img_logBook.png",
                                        onPressed: () {
                                          Get.toNamed(
                                            Routes.LIST_MHS_LOGBOOK,
                                          );
                                        }),
                                    // WidgetCardBtnCustom(
                                    //     text: LogBook,
                                    //     image: "assets/image/img_uang.png",
                                    //     onPressed: () {
                                    //     }),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ))
              ],
            );
          }
        }),
        bottomNavigationBar: Container(
            height: 50,
            color: colorTransparan, // Color of the footer
            child: Container(
              width: double.infinity,
              color: colorTransparan,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              builder: (BuildContext context) {
                                // ProjectModelSingle controller;
                                return  WidgetDatasProject(controller: controller);
                              },
                            );
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              elevation: MaterialStateProperty.all(4),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  greenColor2)),
                          child: Text(Lihat_project,
                              style: whiteTextStyly.copyWith(
                                  fontSize: 18, fontWeight: bold)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
