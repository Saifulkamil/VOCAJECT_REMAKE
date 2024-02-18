import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/modules/logbook/controllers/logbook_controller.dart';
import 'package:vocaject_remake_v1/app/utils/component/widget_appbar.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/colors.dart';

class ListChat extends GetView<LogbookController> {
  const ListChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const AppbarTransparant(title: Pesan),
        body: CustomScrollView(slivers: [
          SliverPrototypeExtentList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Column(
                              children: [
                                ListTile(
                                  trailing: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(date,
                                    style:
                                        ColorApp.secondColorTextStyly(context)
                                            .copyWith(
                                                fontSize: 11,
                                                fontWeight: reguler)),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                      CircleAvatar(
                                        radius: 10,
                                        child: Text(
                                          "10",
                                          style:
                                              whiteTextStyly.copyWith(
                                                      fontSize: 12,
                                                      fontWeight: medium),
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Get.toNamed(Routes.KONSULTASI);
                                  },
                                  leading: const CircleAvatar(
                                    backgroundColor: greyColor,
                                    backgroundImage: NetworkImage("sdfsdfsdf"),
                                  ),
                                  title: Text(
                                    Saiful_Kamil,
                                    style:
                                        ColorApp.secondColorTextStyly(context)
                                            .copyWith(
                                                fontSize: 15,
                                                fontWeight: semiBold),
                                  ),
                                  subtitle: Text(
                                    gimans_kabarnya,
                                    style:
                                        ColorApp.secondColorTextStyly(context)
                                            .copyWith(
                                                fontSize: 13,
                                                fontWeight: medium),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]));
              }, childCount: 5),
              prototypeItem: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3.0),
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () {},
                                leading: const CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  backgroundImage: NetworkImage("sdfsdfsdf"),
                                ),
                                title: const Text("sdfsdfsdfsdfsdf"),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider()
                      ])))
        ]));
  }
}
