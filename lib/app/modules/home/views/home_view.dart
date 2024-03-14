import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../Models/ProjectsData.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/colors.dart';
import '../../../utils/component/widget_cari_text_from_field.dart';
import '../../../utils/component/widget_loading.dart';
import '../../../utils/component/widget_no_data.dart';
import '../../../utils/component/widget_spotlight.dart';
import '../../../utils/component/widget_poject_terbaru.dart';
import '../../../utils/component/widget_kategori_poject.dart';
import '../../../utils/string.dart';
import '../../project_history/controllers/project_history_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final project = Get.find<HomeController>();
    final progressC = Get.find<ProjectHistoryController>();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          toolbarHeight: 63,
          leadingWidth: 148,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    "Hai ${project.userdata!.data.user.name}",
                    overflow: TextOverflow.ellipsis,
                    style: ColorApp.secondColorTextStyly(context)
                        .copyWith(fontSize: 15, fontWeight: reguler),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Image.asset(
                  "assets/image/img_vocaject.png",
                ),
              ],
            ),
          ),
          actions: [
            project.userdata!.data.user.role != "student"
                ? InkWell(
                    child: Padding(
                        padding: const EdgeInsets.only(right: 15.0, top: 18),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.LIST_CHAT);
                            // projectC.getProject();
                          },
                          child: const Stack(
                            children: [
                              Icon(
                                Icons.email_rounded,
                                size: 30,
                                color: greyColor,
                              ),
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: CircleAvatar(
                                    radius: 6,
                                    backgroundColor: redcolor,
                                  )),
                            ],
                          ),
                        )),
                  )
                : const Center(),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.EDIT_PROFILE, arguments: project.userdata);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0, top: 15),
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage("${project.userdata!.data.user.picture}"),
                ),
              ),
            )
          ],
        ),
        body: RefreshIndicator(onRefresh: () {
          project.refreshData();
          progressC.refreshData();
          return Future.value();
        }, child: GetX<HomeController>(builder: (controller) {
          if (!controller.isProjectLoaded.value) {
            // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
            return const Center(child: WidgetLoadingHome());
          } else {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading: false,
                  toolbarHeight: 55,
                  backgroundColor: Theme.of(context).colorScheme.background,
                  centerTitle: true,

                  // widget pencarian
                  title: const WidgetCariTextFromField(),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GetX<ProjectHistoryController>(
                            builder: (historyController) {
                          if (!historyController.isProjectLoaded.value) {
                            // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
                            return const WidgetLoadingSpotligh();
                          } else if (historyController.listProject.isEmpty) {
                            return const Center();
                          } else {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  Spotlight,
                                  style: ColorApp.secondColorTextStyly(context)
                                      .copyWith(
                                          fontSize: 15, fontWeight: medium),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                WidgetSpotlight(controller: historyController),
                                const SizedBox(
                                  height: 7,
                                ),
                              ],
                            );
                          }
                        }),
                        Text(
                          Kategori,
                          style: ColorApp.secondColorTextStyly(context)
                              .copyWith(fontSize: 15, fontWeight: medium),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        const WidgetKategoriPoject(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              Proyek_terbaru,
                              style: ColorApp.secondColorTextStyly(context)
                                  .copyWith(fontSize: 15, fontWeight: medium),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(
                                  Routes.PROJECT_TERBARU_ALL,
                                );
                              },
                              child: Text(
                                Lihat_semua,
                                style: ColorApp.greenTextStyly(context)
                                    .copyWith(fontSize: 15, fontWeight: medium),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPrototypeExtentList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      ProjectsData project = controller.listProject[index];
                      if (controller.listProject.isEmpty) {
                        return const WidgetNoData(
                          text: "Proyek Belum Tersedia",
                          image: "assets/image/img_empty_project.png",
                        );
                      }

                      return Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, bottom: 20),
                          child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.PROJECT_DETAILS,
                                    arguments: project);
                              },
                              //widget tampilan project
                              child: WidgetPojectTerbaru(controller: project)));
                      // child: WidgetLoading()));
                    }, childCount: controller.listProject.length),
                    prototypeItem: const WidgetPojectTerbaruKosong())
              ],
            );
          }
        })));
  }
}
