import 'package:flutter/material.dart';
import 'package:vocaject_remake_v1/app/Models/MahasiswaDetails.dart';
import 'package:vocaject_remake_v1/app/Models/ProjectData.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

import 'widget_tim.dart';

class WidgetDataProject extends StatelessWidget {
  final ProjectData? controller;
  const WidgetDataProject({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(8)),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      Perusahaan,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: ColorApp.secondColorTextStyly(context)
                          .copyWith(fontSize: 15, fontWeight: medium),
                    ),
                    Flexible(
                      child: Text(
                        "${controller!.title}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ColorApp.secondColorTextStyly(context)
                            .copyWith(fontSize: 15, fontWeight: medium),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      builder: (BuildContext context) {
                        return WidgetTim(controller: controller);
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        Tim,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ColorApp.secondColorTextStyly(context)
                            .copyWith(fontSize: 15, fontWeight: medium),
                      ),
                      SizedBox(
                        height: 25,
                        width: 150,
                        child: Scaffold(
                            backgroundColor: colorTransparan,
                            body: CustomScrollView(
                              scrollDirection: Axis.horizontal,
                              slivers: [
                                SliverPrototypeExtentList(
                                  delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                    MahasiswaDetails mahasiswaDetails =
                                        controller!.members[index];
                                    return CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "${mahasiswaDetails.picture}"),
                                    );
                                  }, childCount: controller!.members.length),
                                  prototypeItem: const CircleAvatar(
                                    radius: 13,
                                  ),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      tanggal_pengerjaan,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: ColorApp.secondColorTextStyly(context)
                          .copyWith(fontSize: 15, fontWeight: medium),
                    ),
                    Text(
                      "${controller!.deadline_at}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: ColorApp.secondColorTextStyly(context)
                          .copyWith(fontSize: 15, fontWeight: medium),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

class WidgetDataProjecthistory extends StatelessWidget {
  final ProjectData controller;
  const WidgetDataProjecthistory({
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(8)),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      Perusahaan,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: ColorApp.secondColorTextStyly(context)
                          .copyWith(fontSize: 15, fontWeight: medium),
                    ),
                    Flexible(
                      child: Text(
                        "${controller.title}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ColorApp.secondColorTextStyly(context)
                            .copyWith(fontSize: 15, fontWeight: medium),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      builder: (BuildContext context) {
                        return WidgetTim(controller: controller);
                      },
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        Tim,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: ColorApp.secondColorTextStyly(context)
                            .copyWith(fontSize: 15, fontWeight: medium),
                      ),
                      SizedBox(
                        height: 25,
                        width: 150,
                        child: Scaffold(
                            backgroundColor: colorTransparan,
                            body: CustomScrollView(
                              scrollDirection: Axis.horizontal,
                              slivers: [
                                SliverPrototypeExtentList(
                                  delegate: SliverChildBuilderDelegate(
                                      (context, index) {
                                    MahasiswaDetails mahasiswaDetails = controller.members[index];

                                    return CircleAvatar(
                                      backgroundImage:
                                          NetworkImage("${mahasiswaDetails.picture}"),
                                    );
                                  }, childCount: controller.members.length),
                                  prototypeItem: const CircleAvatar(
                                    radius: 13,
                                  ),
                                )
                              ],
                            )),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      tanggal_pengerjaan,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: ColorApp.secondColorTextStyly(context)
                          .copyWith(fontSize: 15, fontWeight: medium),
                    ),
                    Text(
                      "${controller.deadline_at}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: ColorApp.secondColorTextStyly(context)
                          .copyWith(fontSize: 15, fontWeight: medium),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
