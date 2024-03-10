import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectData.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';

import '../../Models/MahasiswaDetails.dart';
import '../../routes/app_pages.dart';

class WidgetTim extends StatelessWidget {
  final ProjectData? controller;
  const WidgetTim({
    required this.controller,
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:100.0, vertical: 5),
                child: Container(
                  height: 4,
                  color: greyColor,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                MahasiswaDetails mahasiswaDetails = controller!.members[index];
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Column(
                              children: [
                                const SizedBox(height: 5,),
                                ListTile(
                                  onTap: () {
                                    Get.toNamed(Routes.PROFILE_PEOPLE,
                                        arguments: mahasiswaDetails);
                                  },
                                  leading: CircleAvatar(
                                    backgroundColor: greyColor,
                                    backgroundImage: NetworkImage(
                                        "${mahasiswaDetails.picture}"),
                                  ),
                                  title: Text("${mahasiswaDetails.name}"),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                const SizedBox(height: 5,),

                              ],
                            ),
                          ),
                        ]));
              }, childCount: controller!.members.length),
            )
          ])),
        ));
  }
}
