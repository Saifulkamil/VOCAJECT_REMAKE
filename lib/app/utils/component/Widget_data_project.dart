import 'package:flutter/material.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

class WidgetDataProject extends StatelessWidget {
  const WidgetDataProject({
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
                      style: ColorApp.secondColorTextStyly(context).copyWith(
                          fontSize: 15, fontWeight: medium),
                    ),
                    Text(
                      pnl,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: ColorApp.secondColorTextStyly(context).copyWith(
                          fontSize: 15, fontWeight: medium),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      Tim,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: ColorApp.secondColorTextStyly(context).copyWith(
                          fontSize: 15, fontWeight: medium),
                    ),
                    SizedBox(
                      height: 25,
                      width: 150,
                      child: Scaffold(
                          backgroundColor: colorTransparan,
                          body: CustomScrollView(
                            scrollDirection:
                                Axis.horizontal,
                            slivers: [
                              SliverPrototypeExtentList(
                                delegate:
                                    SliverChildBuilderDelegate(
                                        (context, index) {
                                  return const CircleAvatar();
                                }, childCount: 10),
                                prototypeItem:
                                    const CircleAvatar(
                                  radius: 13,
                                ),
                              )
                            ],
                          )),
                    )
                  ],
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
                      style: ColorApp.secondColorTextStyly(context).copyWith(
                          fontSize: 15, fontWeight: medium),
                    ),
                    Text(
                      tanggal,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: ColorApp.secondColorTextStyly(context).copyWith(
                          fontSize: 15, fontWeight: medium),
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
