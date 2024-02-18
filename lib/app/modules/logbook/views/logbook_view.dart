
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/fungsi_widget_random.dart';
import '../../../utils/colors.dart';
import '../../../utils/component/widget_buat_logbook.dart';
import '../../../utils/string.dart';
import '../controllers/logbook_controller.dart';

class LogbookView extends GetView<LogbookController> {
  const LogbookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final flowC = Get.put(WidgetController());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        elevation: 0,
        title: Text(
          LogBook,
          style: ColorApp.secondColorTextStyly(context)
              .copyWith(fontSize: 20, fontWeight: semiBold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    builder: (BuildContext context) {
                      return WidgetBuatLogbook(flowC: flowC);
                    },
                  );
                },
                icon: Icon(
                  Icons.add,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 35,
                )),
          )
        ],
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.secondary,
            )),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPrototypeExtentList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  borderRadius: BorderRadius.circular(8)),
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      tanggal,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          ColorApp.secondColorTextStyly(context)
                                              .copyWith(
                                                  fontSize: 15,
                                                  fontWeight: semiBold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      isiLogbok,
                                      maxLines: 14,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          ColorApp.secondColorTextStyly(context)
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: reguler),
                                    )
                                  ],
                                ),
                              )),
                        ]));
              }, childCount: 10),
              prototypeItem: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(LogBook,
                        style: blackTextStyly.copyWith(
                            fontSize: 17, fontWeight: semiBold)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(8)),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tanggal,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: blackTextStyly.copyWith(
                                      fontSize: 15, fontWeight: semiBold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  isiLogbok,
                                  maxLines: 14,
                                  overflow: TextOverflow.ellipsis,
                                  style: blackTextStyly.copyWith(
                                      fontSize: 14, fontWeight: reguler),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ])),
        ],
      ),
    );
  }
}
