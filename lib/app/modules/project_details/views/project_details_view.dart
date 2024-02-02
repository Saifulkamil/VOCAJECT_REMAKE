import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/component/widget_ajukan_project.dart';
import '../../../utils/string.dart';
import '../controllers/project_details_controller.dart';

class ProjectDetailsView extends GetView<ProjectDetailsController> {
  const ProjectDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: colorTransparan,
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 324,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(15),
                            bottomRight: Radius.circular(15)),
                        child: Image.asset(
                          "assets/image/img_bg_detail_project.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 50,
                          color: colorTransparan,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, top: 15),
                              child: Row(
                                children: [
                                  Material(
                                    color: colorTransparan,
                                    child: InkWell(
                                        onTap: () {
                                          Get.back();
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: Icon(
                                            Icons.arrow_back,
                                            color: whiteColor,
                                          ),
                                        )),
                                  ),
                                  Text(
                                    Aplikasi_Vocaject,
                                    style: whiteTextStyly.copyWith(
                                        fontSize: 20, fontWeight: semiBold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/image/ic_mobile.png",
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              Aplikasi_Vocaject,
                              style: whiteTextStyly.copyWith(
                                  fontSize: 20, fontWeight: medium),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  Deadline,
                                  style: whiteTextStyly.copyWith(
                                      fontSize: 12, fontWeight: reguler),
                                ),
                                Text(dd_mm_yyyy,
                                    style: whiteTextStyly.copyWith(
                                        fontSize: 15, fontWeight: reguler)),
                              ],
                            ),
                            Container(
                              height: 37,
                              width: 2,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: whiteColor),
                            ),
                            Column(
                              children: [
                                Text(
                                  Harga,
                                  style: whiteTextStyly.copyWith(
                                      fontSize: 12, fontWeight: reguler),
                                ),
                                Text(price,
                                    style: whiteTextStyly.copyWith(
                                        fontSize: 15, fontWeight: reguler)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Container(
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
                                      deskripsi,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style:
                                          ColorApp.secondColorTextStyly(context)
                                              .copyWith(
                                                  fontSize: 18,
                                                  fontWeight: semiBold),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      Isideskripsi,
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
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Material(
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                            borderRadius: BorderRadius.circular(8),
                            child: InkWell(
                              onTap: () {
                                // Get.to(() =>
                                // ProfilindustribyProject(list: list, index: index));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8)),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 0),
                                        child: Row(
                                          children: [
                                            const CircleAvatar(
                                              backgroundImage: AssetImage(
                                                "assets/image/img_tesla.png",
                                              ),
                                              backgroundColor: Color.fromARGB(
                                                  255, 205, 205, 205),
                                              radius: 30,
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0, right: 1),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      Politeknik_Negeri_Lhokseumawe,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: ColorApp
                                                              .secondColorTextStyly(
                                                                  context)
                                                          .copyWith(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  semiBold),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Text(
                                                      kota_Lhokseumawe_aceh,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: ColorApp
                                                              .secondColorTextStyly(
                                                                  context)
                                                          .copyWith(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  medium),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Text(
                                                      informatika,
                                                      style: ColorApp
                                                              .secondColorTextStyly(
                                                                  context)
                                                          .copyWith(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  reguler),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ))
          ],
        ),
        bottomNavigationBar: Container(
            height: 60,
            // color: Colors.blue, // Color of the footer
            child: Container(
              width: double.infinity,
              height: 50,
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {
                          // Get.toNamed(Routes.PAGE_CHAT);
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(color: greyColor, width: 0.5,),)),
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).colorScheme.secondaryContainer,)),
                        child: const Icon(
                          Icons.chat_outlined,
                          color: greyColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              builder: (BuildContext context) {
                                return const widgetAjukanProject();
                              },
                            );
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              elevation: MaterialStateProperty.all(4),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  greenColor2)),
                          child: Text(Ajukan_Proposal,
                              style: whiteTextStyly.copyWith(
                                  fontSize: 18, fontWeight: bold)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
