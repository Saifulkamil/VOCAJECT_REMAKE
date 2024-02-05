import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/modules/logbook/controllers/logbook_controller.dart';
import 'package:vocaject_remake_v1/app/utils/component/widget_appbar.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/colors.dart';

class ListMhsLogbook extends GetView<LogbookController> {
  const ListMhsLogbook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const AppbarTransparant(title: daftar_mahasiswa),
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
                                padding: const EdgeInsets.symmetric(horizontal:3.0),
                                child: Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        Get.toNamed(Routes.LOGBOOK);
                                      },
                                      leading: const CircleAvatar(
                                        backgroundColor: greyColor,
                                        backgroundImage:
                                            NetworkImage("sdfsdfsdf"),
                                      ),
                                      title: const Text("sdfsdfsdfsdfsdf"),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                    ),
                                  ],
                                ),
                           ),
                        ]));
              }, childCount: 5),
              prototypeItem:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                           Padding(
                                padding: const EdgeInsets.symmetric(horizontal:3.0),
                                child: Column(
                                  children: [
                                    ListTile(
                                      onTap: () {
                                        Get.toNamed(Routes.LOGBOOK);
                                      },
                                      leading: const CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        backgroundImage:
                                            NetworkImage("sdfsdfsdf"),
                                      ),
                                      title: const Text("sdfsdfsdfsdfsdf"),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      
                                    ),
                                  ],
                                ),
                           ),
                           const Divider()

                        ]))
                      )
        ]));
  }
}
