import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vocaject_remake_v1/app/routes/app_pages.dart';

import '../../../utils/colors.dart';
import '../../../utils/component/widget_data_project_.dart';
import '../../../utils/string.dart';
import '../controllers/project_details_pending_controller.dart';

class ProjectDetailsPendingView
    extends GetView<ProjectDetailsPendingController> {
  const ProjectDetailsPendingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorTransparan,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: GetX<ProjectDetailsPendingController>(builder: (controller) {
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
                        height: 324,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                          child: Image.asset(
                            "assets/image/img_bg_detail_project.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            color: colorTransparan,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 15.0, top: 15),
                                child: Row(
                                  children: [
                                    Material(
                                      color: colorTransparan,
                                      child: InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: const Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.0),
                                            child: Icon(
                                              Icons.arrow_back,
                                              color: whiteColor,
                                            ),
                                          )),
                                    ),
                                    Text(
                                      Detail_Project,
                                      style: whiteTextStyly.copyWith(
                                          fontSize: 20, fontWeight: reguler),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Builder(
                                  builder: (context) {
                                    final Map<String, String> categoryImage = {
                                      "desain grafis":
                                          "assets/image/ic_desain.png",
                                      "situs web": "assets/image/ic_web.png",
                                      "aplikasi seluler":
                                          "assets/image/ic_mobile.png",
                                      "video permainan":
                                          "assets/image/ic_game.png",
                                      "video editing":
                                          "assets/image/ic_editor.png",
                                    };
                                    String? selectedImage = categoryImage[
                                        controller.projectData!.category.name];

                                    if (selectedImage != null) {
                                      return SizedBox(
                                        height: 70,
                                        width: 70,
                                        child: Image.asset(
                                          selectedImage,
                                        ),
                                      );
                                    } else {
                                      return const Center();
                                    }
                                  },
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Flexible(
                                  child: Text(
                                    "${controller.projectData!.title}",
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: whiteTextStyly.copyWith(
                                        fontSize: 20, fontWeight: medium),
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    Deadline,
                                    style: whiteTextStyly.copyWith(
                                        fontSize: 12, fontWeight: reguler),
                                  ),
                                  Text("${controller.projectData!.deadline_at}",
                                      style: whiteTextStyly.copyWith(
                                          fontSize: 15, fontWeight: reguler)),
                                ],
                              ),
                              Container(
                                height: 37,
                                width: 2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: whiteColor),
                              ),
                              Column(
                                children: [
                                  Text(
                                    Harga,
                                    style: whiteTextStyly.copyWith(
                                        fontSize: 12, fontWeight: reguler),
                                  ),
                                  Text(
                                      formatter.format(
                                          controller.projectData!.budget),
                                      style: whiteTextStyly.copyWith(
                                          fontSize: 15, fontWeight: reguler)),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondaryContainer,
                                    borderRadius: BorderRadius.circular(8)),
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        deskripsi,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: ColorApp.secondColorTextStyly(
                                                context)
                                            .copyWith(
                                                fontSize: 18,
                                                fontWeight: semiBold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${controller.projectData!.description}",
                                        maxLines: 14,
                                        overflow: TextOverflow.ellipsis,
                                        style: ColorApp.secondColorTextStyly(
                                                context)
                                            .copyWith(
                                                fontSize: 14,
                                                fontWeight: reguler),
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                          WidgetDataProject(controller: controller.projectData , userData: controller.userdata),
                          
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Material(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                              borderRadius: BorderRadius.circular(8),
                              child: InkWell(
                                onTap: () {
                                  Get.toNamed(Routes.PROFILE_INDUSTRI_2,
                                      arguments: controller.projectData);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8)),
                                    width: double.infinity,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                  "${controller.projectData!.company.picture}",
                                                ),
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 205, 205, 205),
                                                radius: 30,
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10.0, right: 1),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "${controller.projectData!.company.name}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: ColorApp
                                                                .secondColorTextStyly(
                                                                    context)
                                                            .copyWith(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    semiBold),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        "${controller.projectData!.company.address}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: ColorApp
                                                                .secondColorTextStyly(
                                                                    context)
                                                            .copyWith(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    medium),
                                                      ),
                                                      const SizedBox(height: 5),
                                                      Text(
                                                        "${controller.projectData!.company.email}",
                                                        style: ColorApp
                                                                .secondColorTextStyly(
                                                                    context)
                                                            .copyWith(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    reguler),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
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
    );
  }
}
