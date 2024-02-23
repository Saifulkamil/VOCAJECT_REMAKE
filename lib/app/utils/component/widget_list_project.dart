import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

import '../../routes/app_pages.dart';

class WidgetListproject extends StatelessWidget {
  final dynamic listproject;

  const WidgetListproject({
   required this.listproject,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 702,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Scaffold(
              body: CustomScrollView(slivers: [
            SliverPrototypeExtentList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(Routes.PROJECT_DETAILS);
                    },
                    child: Stack(
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
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.video_camera_back_outlined,
                                        color: whiteColor,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        Edit_profil,
                                        style: whiteTextStyly.copyWith(
                                            fontSize: 12, fontWeight: reguler),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          Video_pendek,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: whiteTextStyly.copyWith(
                                              fontSize: 12,
                                              fontWeight: reguler),
                                        ),
                                      ),
                                      Text(
                                        price,
                                        style: whiteTextStyly.copyWith(
                                            fontSize: 12, fontWeight: medium),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 75,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/image/img_foto.jpg"),
                                          radius: 20,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          Tesla,
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
                    ),
                  );
                }, childCount: 5),
                prototypeItem: Column(
                  children: [
                    Stack(
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
                        Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.video_camera_back_outlined,
                                        color: whiteColor,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        Edit_profil,
                                        style: whiteTextStyly.copyWith(
                                            fontSize: 12, fontWeight: reguler),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: Text(
                                          Video_pendek,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: whiteTextStyly.copyWith(
                                              fontSize: 12,
                                              fontWeight: reguler),
                                        ),
                                      ),
                                      Text(
                                        price,
                                        style: whiteTextStyly.copyWith(
                                            fontSize: 12, fontWeight: medium),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 75,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        const CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/image/img_foto.jpg"),
                                          radius: 20,
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          Tesla,
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
                    ),
                    const SizedBox(height: 10)
                  ],
                ))
          ])),
        ));
  }
}



class WidgetListprojectkosong extends StatelessWidget {

  const WidgetListprojectkosong({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 702,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
          child: Scaffold(
              body: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              "assets/image/img_home_desain.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                )
          ])),
        ));
  }
}
