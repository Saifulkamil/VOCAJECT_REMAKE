import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../Models/ProjectData.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/colors.dart';
import '../../../utils/component/widget_loading.dart';
import '../../../utils/component/widget_no_data.dart';
import '../../../utils/component/widget_poject_terbaru.dart';
import '../../../utils/string.dart';
import '../controllers/project_history_controller.dart';

class ProjectHistoryMSHView extends GetView<ProjectHistoryController> {
  const ProjectHistoryMSHView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.background,
            appBar: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              title: Center(
                  child: Text(Daftar_Project,
                      style: ColorApp.secondColorTextStyly(context)
                          .copyWith(fontSize: 20, fontWeight: semiBold))),
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              elevation: 0,
              bottom: const TabBar(
                  indicatorColor: greenColor,
                  labelColor: greenColor,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      child: Center(
                          child: Text(
                        Diproses,
                        style: TextStyle(fontSize: 13),
                      )),
                    ),
                    Tab(
                      child: Center(
                          child: Text(
                        Selesai,
                        style: TextStyle(fontSize: 13),
                      )),
                    ),
                  ]),
            ),
            body: TabBarView(children: [
              RefreshIndicator(
                onRefresh: controller.refreshData,
                child: GetX<ProjectHistoryController>(builder: (controller) {
                  if (!controller.isProjectLoaded.value) {
                    // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
                    return const Center(child: WidgetLoadingproject());
                  } else if (controller
                      .proposalListMhsAcceptOnProgres.isEmpty) {
                    return const WidgetNoData(
                      text: "Proyek Belum Tersedia",
                      image: "assets/image/img_empty_project.png",
                    );
                  } else {
                    return CustomScrollView(
                      slivers: [
                        SliverPrototypeExtentList(
                            delegate: SliverChildBuilderDelegate(
                                (context, index) {
                              ProjectData project = controller
                                  .proposalListMhsAcceptOnProgres[index];

                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15, top: 20),
                                child: InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.PROJECT_PROGRESS,
                                          arguments: project);
                                    },
                                    child: WidgetImgProgresPoject(
                                      controller: project,
                                    )),
                              );
                            },
                                childCount: controller
                                    .proposalListMhsAcceptOnProgres.length),
                            prototypeItem: const WidgetImgProgresPojectKosong())
                      ],
                    );
                  }
                }),
              ),
              RefreshIndicator(
                onRefresh: controller.refreshData,
                child: GetX<ProjectHistoryController>(builder: (controller) {
                  if (!controller.isProjectLoaded.value) {
                    // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
                    return const Center(child: WidgetLoadingproject());
                  } else if (controller.proposalListMhsselesai.isEmpty) {
                    return const WidgetNoData(
                      text: "Proyek Belum Tersedia",
                      image: "assets/image/img_empty_project.png",
                    );
                  } else {
                    return CustomScrollView(
                      slivers: [
                        SliverPrototypeExtentList(
                            delegate: SliverChildBuilderDelegate(
                                (context, index) {
                              final project =
                                  controller.proposalListMhsselesai[index];

                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15, top: 20),
                                child: InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.PROJECT_PROGRESS);
                                    },
                                    child: WidgetImgProgresPoject(
                                      controller: project,
                                    )),
                              );
                            },
                                childCount:
                                    controller.proposalListMhsselesai.length),
                            prototypeItem: const WidgetImgProgresPojectKosong())
                      ],
                    );
                  }
                }),
              ),
            ]),
          )),
    );
  }
}
