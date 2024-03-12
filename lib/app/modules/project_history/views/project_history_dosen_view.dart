import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectData.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/colors.dart';
import '../../../utils/component/widget_loading.dart';
import '../../../utils/component/widget_poject_terbaru.dart';
import '../../../utils/string.dart';
import '../controllers/project_history_controller.dart';

class ProjectHistoryDosenView extends GetView<ProjectHistoryController> {
  const ProjectHistoryDosenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: DefaultTabController(
          length: 4,
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
                        Menunggu,
                        style: TextStyle(fontSize: 13),
                      ),
                    )),
                    Tab(
                      child: Center(
                          child: Text(
                        Selesai,
                        style: TextStyle(fontSize: 13),
                      )),
                    ),
                    Tab(
                        child: Center(
                      child: Text(
                        Ditolak,
                        style: TextStyle(fontSize: 13),
                      ),
                    ))
                  ]),
            ),

            // tab onProgress
            body: TabBarView(children: [
              Scaffold(
                  backgroundColor: Colors.transparent,
                  body: RefreshIndicator(
                    onRefresh: controller.refreshData,
                    child:
                        GetX<ProjectHistoryController>(builder: (controller) {
                      if (!controller.isProjectLoaded.value) {
                        // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
                        return const Center(child: WidgetLoadingproject());
                      } else if (controller
                          .proposalListDosenAcceptOnProgres.isEmpty) {
                        return const Text("kosong");
                      } else {
                        return CustomScrollView(
                          slivers: [
                            SliverPrototypeExtentList(
                                delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                  ProjectData project = controller
                                      .proposalListDosenAcceptOnProgres[index];
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
                                        .proposalListDosenAcceptOnProgres
                                        .length),
                                prototypeItem:
                                    const WidgetPojectTerbaruKosong())
                          ],
                        );
                      }
                    }),
                  )),

              // tab pending
              RefreshIndicator(
                onRefresh: controller.refreshData,
                child: GetX<ProjectHistoryController>(builder: (controller) {
                  if (!controller.isProjectLoaded.value) {
                    // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.proposalListDosenPending.isEmpty) {
                    return const Text("kosong");
                  } else {
                    return Scaffold(
                      backgroundColor: Colors.transparent,
                      body: CustomScrollView(
                        slivers: [
                          SliverPrototypeExtentList(
                              delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                ProjectData project =
                                    controller.proposalListDosenPending[index];

                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15, top: 20),
                                  child: InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                            Routes.PROJECT_DETAILS_PENDING,
                                            arguments: project);
                                      },
                                      child: WidgetImgProgresPoject(
                                        controller: project,
                                      )),
                                );
                              },
                                  childCount: controller
                                      .proposalListDosenPending.length),
                              prototypeItem: const WidgetPojectTerbaruKosong())
                        ],
                      ),
                    );
                  }
                }),
              ),

              RefreshIndicator(
                onRefresh: controller.refreshData,
                child: GetX<ProjectHistoryController>(builder: (controller) {
                  if (!controller.isProjectLoaded.value) {
                    // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.proposalListDosenselesai.isEmpty) {
                    return const Text("kosong");
                  } else {
                    return Scaffold(
                      backgroundColor: Colors.transparent,
                      body: CustomScrollView(
                        slivers: [
                          SliverPrototypeExtentList(
                              delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                ProjectData project =
                                    controller.proposalListDosenselesai[index];

                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15, top: 20),
                                  child: InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                            Routes.PROJECT_PROGRESS,
                                            arguments: project);
                                      },
                                      child: WidgetImgProgresPoject(
                                        controller: project,
                                      )),
                                );
                              },
                                  childCount: controller
                                      .proposalListDosenselesai.length),
                              prototypeItem: const WidgetPojectTerbaruKosong())
                        ],
                      ),
                    );
                  }
                }),
              ),
              RefreshIndicator(
                    onRefresh: controller.refreshData ,
                child: GetX<ProjectHistoryController>(builder: (controller) {
                  if (!controller.isProjectLoaded.value) {
                    // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
                    return const Center(child: CircularProgressIndicator());
                  } else if (controller.proposalListDosenReject.isEmpty) {
                    return const Text("kosong");
                  } else {
                    return Scaffold(
                      backgroundColor: Colors.transparent,
                      body: CustomScrollView(
                        slivers: [
                          SliverPrototypeExtentList(
                              delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                ProjectData project =
                                    controller.proposalListDosenselesai[index];
                
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15, top: 20),
                                  child: InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.PROJECT_DETAILS_PENDING,
                                          arguments: project);
                                    },
                                    child: WidgetImgProgresPoject(
                                      controller: project,
                                    ),
                                  ),
                                );
                              },
                                  childCount:
                                      controller.proposalListDosenselesai.length),
                              prototypeItem: const WidgetPojectTerbaruKosong())
                        ],
                      ),
                    );
                  }
                }),
              )
            ]),
          )),
    );
  }
}
