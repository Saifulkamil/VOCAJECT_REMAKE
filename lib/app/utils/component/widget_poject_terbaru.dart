import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../colors.dart';
import '../string.dart';

//widget tampilan project
class WidgetPojectTerbaru extends StatelessWidget {
  final dynamic controller;

  const WidgetPojectTerbaru({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Builder(
                builder: (context) {
                  final Map<String, String> categoryImage = {
                    "desain grafis": "assets/image/img_project_desain.png",
                    "situs web": "assets/image/img_project_web.png",
                    "aplikasi seluler": "assets/image/img_project_aplikasi.png",
                    "video permainan": "assets/image/img_project_game.png",
                    "video editing": "assets/image/img_project_video.png",
                  };
                  String? selectedImage =
                      categoryImage[controller.category.name];

                  if (selectedImage != null) {
                    return Image.asset(
                      selectedImage,
                      fit: BoxFit.fill,
                    );
                  } else {
                    return const Center();
                  }
                },
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Builder(
                        builder: (context) {
                          final Map<String, IconData> categoryIcons = {
                            "video editing": Icons.video_camera_back_outlined,
                            "video permainan": Icons.games_rounded,
                            "situs web": Icons.web_outlined,
                            "aplikasi seluler": Icons.phone_android,
                            "desain grafis": Icons.design_services_sharp,
                          };
                          IconData? selectedIcon =
                              categoryIcons[controller.category.name];

                          if (selectedIcon != null) {
                            return Icon(
                              selectedIcon,
                              color: Colors.white,
                            );
                          } else {
                            return const Center();
                          }
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        controller.category.name,
                        style: whiteTextStyly.copyWith(
                            fontSize: 12, fontWeight: reguler),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: Text(
                          controller.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: whiteTextStyly.copyWith(
                              fontSize: 12, fontWeight: reguler),
                        ),
                      ),
                      Text(
                        formatter.format(controller.budget),
                        style: whiteTextStyly.copyWith(
                            fontSize: 12, fontWeight: medium),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 9.0),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("${controller.company.picture}"),
                                radius: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          controller.company.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: whiteTextStyly.copyWith(
                              fontSize: 12, fontWeight: medium),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WidgetImgProgresPoject extends StatelessWidget {
  final dynamic controller;

  const WidgetImgProgresPoject({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Builder(
                builder: (context) {
                  final Map<String, String> categoryImage = {
                    "desain grafis": "assets/image/img_project_desain.png",
                    "situs web": "assets/image/img_project_web.png",
                    "aplikasi seluler": "assets/image/img_project_aplikasi.png",
                    "video permainan": "assets/image/img_project_game.png",
                    "video editing": "assets/image/img_project_video.png",
                  };
                  String? selectedImage =
                      categoryImage[controller.category.name];

                  if (selectedImage != null) {
                    return Image.asset(
                      selectedImage,
                      fit: BoxFit.fill,
                    );
                  } else {
                    return const Center();
                  }
                },
              )),
        ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircularPercentIndicator(
                    radius: 17,
                    lineWidth: 4,
                    percent: 0.6,
                    center: Text(
                      "60%",
                      style: whiteTextStyly.copyWith(fontSize: 10),
                    ),
                    progressColor: whiteColor,
                  ),
                  SizedBox(
                    width: 150,
                    child: Text(
                      controller.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: whiteTextStyly.copyWith(
                          fontSize: 15, fontWeight: reguler),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        Tim,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: whiteTextStyly.copyWith(
                            fontSize: 14, fontWeight: medium),
                      ),
                      SizedBox(
                        height: 20,
                        width: 100,
                        child: Scaffold(
                            backgroundColor: colorTransparan,
                            body: CustomScrollView(
                              scrollDirection: Axis.horizontal,
                              slivers: [
                                SliverPrototypeExtentList(
                                  delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                    return const CircleAvatar();
                                  }, childCount: 10),
                                  prototypeItem: const CircleAvatar(
                                    radius: 10,
                                  ),
                                )
                              ],
                            )),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 9.0),
                              child: CircleAvatar(
                                backgroundImage:
                                    AssetImage("${controller.company.picture}"),
                                radius: 20,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          controller.company.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: whiteTextStyly.copyWith(
                              fontSize: 12, fontWeight: medium),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WidgetImgProgresPojectKosong extends StatelessWidget {
  const WidgetImgProgresPojectKosong({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              "assets/image/img_home_desain.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}

class WidgetPojectTerbaruKosong extends StatelessWidget {
  const WidgetPojectTerbaruKosong({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          "assets/image/img_home_desain.png",
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
