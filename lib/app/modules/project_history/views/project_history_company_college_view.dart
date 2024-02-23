import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/colors.dart';
import '../../../utils/component/widget_poject_terbaru.dart';
import '../../../utils/string.dart';
import '../controllers/project_history_controller.dart';

class ProjectHistoryCompanyCollegeView extends GetView<ProjectHistoryController> {
  const ProjectHistoryCompanyCollegeView({Key? key}) : super(key: key);
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
            body: TabBarView(children: [
              Scaffold(
                  backgroundColor: Colors.transparent,
                  body: GetX<ProjectHistoryController>(builder: (controller) {
                    if (!controller.isProjectLoaded.value) {
                      // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
                      return const Center(child: CircularProgressIndicator());
                    } else if (controller.proposalListindustriDankampusAcceptOnProgres.isEmpty) {
                  return const Text("kosong");
                } else {
                      return CustomScrollView(
                        slivers: [
                          SliverPrototypeExtentList(
                              delegate:
                                  SliverChildBuilderDelegate((context, index) {
                      final project = controller.proposalListindustriDankampusAcceptOnProgres[index];

                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, right: 15, top: 20),
                                  child: InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.PROJECT_PROGRESS);
                                      },
                                      child:  WidgetImgProgresPoject(controller: project,)),
                                );
                              }, childCount: controller.proposalListindustriDankampusAcceptOnProgres.length),
                              prototypeItem:
                                  const WidgetImgProgresPojectKosong())
                        ],
                      );
                    }
                  })),
              GetX<ProjectHistoryController>(builder: (controller) {
                if (!controller.isProjectLoaded.value) {
                  // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.proposalListindustriDankampuspendding.isEmpty) {
                  return const Text("kosong");
                } else {
                  return Scaffold(
                    backgroundColor: Colors.transparent,
                    body: CustomScrollView(
                      slivers: [
                        SliverPrototypeExtentList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                      final project = controller.proposalListindustriDankampuspendding[index];

                              return  Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15, top: 20),
                                child: WidgetImgProgresPoject(controller: project,),
                              );
                            }, childCount: controller.proposalListindustriDankampuspendding.length),
                            prototypeItem: const WidgetImgProgresPojectKosong())
                      ],
                    ),
                  );
                }
              }),
              GetX<ProjectHistoryController>(builder: (controller) {
                if (!controller.isProjectLoaded.value) {
                  // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.proposalListindustriDankampusSelesai.isEmpty) {
                  return const Text("kosong");
                } else  {
                  return Scaffold(
                    backgroundColor: Colors.transparent,
                    body: CustomScrollView(
                      slivers: [
                        SliverPrototypeExtentList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                      final project = controller.proposalListindustriDankampusSelesai[index];

                              return  Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15, top: 20),
                                child: WidgetImgProgresPoject(controller: project,),
                              );
                            }, childCount: controller.proposalListindustriDankampusSelesai.length),
                            prototypeItem: const WidgetImgProgresPojectKosong())
                      ],
                    ),
                  );
                }
              }),
              GetX<ProjectHistoryController>(builder: (controller) {
                if (!controller.isProjectLoaded.value) {
                  // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.proposalListindustriDankampusReject.isEmpty) {
                  return const Text("kosong");
                } else {
                  return Scaffold(
                    backgroundColor: Colors.transparent,
                    body: CustomScrollView(
                      slivers: [
                        SliverPrototypeExtentList(
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
                      final project = controller.proposalListindustriDankampusReject[index];

                              return  Padding(
                                padding: const EdgeInsets.only(
                                    left: 15.0, right: 15, top: 20),
                                child: WidgetImgProgresPoject(controller: project,),
                              );
                            }, childCount: controller.proposalListindustriDankampusReject.length),
                            prototypeItem: const WidgetImgProgresPojectKosong())
                      ],
                    ),
                  );
                }
              })
            ]),
          )),
    );
  }
}
