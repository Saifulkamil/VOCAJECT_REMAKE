import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectData.dart';

import '../../modules/project_history/controllers/project_history_controller.dart';
import '../../routes/app_pages.dart';
import '../colors.dart';

// kerangka widget progress
class WidgetSpotlight extends StatelessWidget {
  //final ProjectModel projectModel; // Ubah tipe parameter menjadi ProjectModel
  final ProjectHistoryController controller;
  const WidgetSpotlight({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<dynamic> latestProjects = controller.listProject.length > 3
        ? controller.listProject.sublist(controller.listProject.length - 3)
        : controller.listProject;

    return SizedBox(
      width: double.infinity,
      height: 122,
      child: Scaffold(
        body: CustomScrollView(
          scrollDirection: Axis.horizontal,
          slivers: [
            SliverPrototypeExtentList(
              delegate: SliverChildBuilderDelegate((context, index) {
                ProjectData project = controller.listProject[index];

                return Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.PROJECT_PROGRESS, arguments: project);
                    },
                    child: ChildProgress(controller: project),
                  ),
                );
              }, childCount: latestProjects.length),
              prototypeItem: const Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: ChildProgresskosong(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// decoration widget progress
class ChildProgress extends StatelessWidget {
  final ProjectData controller;

  const ChildProgress({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 122,
          width: 157,
          child: Stack(
            children: [
              Image.asset(
                "assets/image/img_home1.png",
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 34,
                      width: 141,
                      decoration: BoxDecoration(
                          color: whiteColor50,
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                          padding: const EdgeInsets.only(left: 4.0, right: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircularPercentIndicator(
                                radius: 14.0,
                                lineWidth: 2.5,
                                percent: controller.progress?.toDouble() != null
                                    ? controller.progress! /
                                        100.0 // Mengonversi nilai persentase ke rentang 0.0 - 1.0
                                    : 0.0, // Nilai default jika nilai persentase null
                                center: Text(
                                  "${controller.progress}%",
                                  style: whiteTextStyly.copyWith(fontSize: 8),
                                ),
                                progressColor: whiteColor,
                              ),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "${controller.deadline_at}",
                                  style: whiteTextStyly.copyWith(
                                      fontSize: 12, fontWeight: reguler),
                                ),
                              )
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 11.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${controller.title}",
                            overflow: TextOverflow.ellipsis,
                            style: whiteTextStyly.copyWith(
                                fontSize: 13, fontWeight: semiBold),
                          ),
                          Text(
                            "${controller.category.name}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: whiteTextStyly.copyWith(
                                fontSize: 12, fontWeight: medium),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class ChildProgresskosong extends StatelessWidget {
  const ChildProgresskosong({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        SizedBox(
          height: 122,
          width: 157,
        ),
      ],
    );
  }
}
