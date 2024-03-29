import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/component/widget_buat_logbook.dart';
import '../../../utils/component/widget_loading.dart';
import '../../../utils/component/widget_no_data.dart';
import '../../../utils/string.dart';
import '../controllers/logbook_controller.dart';

class LogbookView extends GetView<LogbookController> {
  const LogbookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final flowC = Get.put(WidgetController());
    final logboookController = Get.find<LogbookController>();
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
            logboookController.userdata!.data.user.role == "student"
                ? Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            builder: (BuildContext context) {
                              return WidgetBuatLogbook(
                                projectC: logboookController,
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.add,
                          color: Theme.of(context).colorScheme.secondary,
                          size: 35,
                        )),
                  )
                : const Center()
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
        body: RefreshIndicator(
          onRefresh: logboookController.refreshData,
          child: GetX<LogbookController>(builder: (controller) {
            if (!controller.isProjectLoaded.value) {
              // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
              return const WidgetLogBookProjectLoading();
            } else if (controller.listDatalogbook.isEmpty) {
              // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
              return const WidgetNoData(
                text: "LogBook Mahasiswa Belum Ada",
                image: "assets/image/img_not_Logbook.png",
              );
            } else {
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final project = controller.listDatalogbook[
                            controller.listDatalogbook.length - index - 1];
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
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${project.submited_at}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: ColorApp.secondColorTextStyly(
                                                context)
                                            .copyWith(
                                          fontSize: 15,
                                          fontWeight: FontWeight
                                              .bold, // Ganti semiBold dengan FontWeight.bold
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${project.description}",
                                        maxLines: 14,
                                        overflow: TextOverflow.ellipsis,
                                        style: ColorApp.secondColorTextStyly(
                                                context)
                                            .copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight
                                              .normal, // Ganti reguler dengan FontWeight.normal
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      childCount: controller.listDatalogbook.length,
                    ),
                  ),
                ],
              );
            }
          }),
        ));
  }
}
