import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';

import '../../routes/app_pages.dart';

class WidgetTim extends StatelessWidget {
  const WidgetTim({
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
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Get.toNamed(Routes.PROFILE_PEOPLE);
                                    },
                                    leading: const CircleAvatar(
                                      backgroundColor: greyColor,
                                      backgroundImage:
                                          NetworkImage("sdfsdfsdf"),
                                    ),
                                    title: const Text("sdfsdfsdfsdfsdf"),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
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
                        ])))
          ])),
        ));
  }
}
