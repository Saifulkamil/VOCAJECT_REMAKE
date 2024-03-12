import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/modules/profile/controllers/profile_controller_company_2.dart';

import '../../../utils/colors.dart';
import '../../../utils/string.dart';

class Profileindustri2 extends GetView<ProfileControllerCompany2> {
  const Profileindustri2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: colorTransparan,
          elevation: 0,
          toolbarHeight: 0,
        ),
        body: GetX<ProfileControllerCompany2>(builder: (controller) {
          if (!controller.isProjectLoaded.value) {
            // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
            return const Center(child: CircularProgressIndicator());
          } else {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: 440,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15)),
                            child: Image.asset(
                              Theme.of(context).brightness == Brightness.dark
                                  ? "assets/image/img_dark.png"
                                  : "assets/image/img_light.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              color: colorTransparan,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 15),
                                  child: Row(
                                    children: [
                                      Material(
                                        color: colorTransparan,
                                        child: InkWell(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10.0),
                                              child: Icon(
                                                Icons.arrow_back,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary,
                                              ),
                                            )),
                                      ),
                                      Text(
                                        Profil_company,
                                        style: ColorApp.secondColorTextStyly(
                                                context)
                                            .copyWith(
                                                fontSize: 20,
                                                fontWeight: semiBold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                             CircleAvatar(
                              backgroundImage:
                                  NetworkImage("${controller.dataProfil!.company.picture}"),
                              backgroundColor: Colors.grey,
                              radius: 45,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${controller.dataProfil!.company.name}",
                              style: ColorApp.secondColorTextStyly(context)
                                  .copyWith(fontSize: 20, fontWeight: reguler),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          deskripsi,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: ColorApp.secondColorTextStyly(
                                                  context)
                                              .copyWith(
                                                  fontSize: 18,
                                                  fontWeight: semiBold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "${controller.dataProfil!.company.description}",
                                          maxLines: 14,
                                          overflow: TextOverflow.ellipsis,
                                          style: ColorApp.secondColorTextStyly(
                                                  context)
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: reguler),
                                        )
                                      ],
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        Alamat,
                                        style: ColorApp.secondColorTextStyly(
                                                context)
                                            .copyWith(
                                                fontSize: 14, fontWeight: bold),
                                      ),
                                      Text(
                                        " : ",
                                        style: ColorApp.secondColorTextStyly(
                                                context)
                                            .copyWith(
                                                fontSize: 14, fontWeight: bold),
                                      ),
                                      Text(
                                        "${controller.dataProfil!.company.address}",
                                        style: ColorApp.secondColorTextStyly(
                                                context)
                                            .copyWith(
                                                fontSize: 14, fontWeight: bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    decoration:
                                        const BoxDecoration(color: greyColor),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        Email,
                                        style: ColorApp.secondColorTextStyly(
                                                context)
                                            .copyWith(
                                                fontSize: 14, fontWeight: bold),
                                      ),
                                      Text(
                                        " : ",
                                        style: ColorApp.secondColorTextStyly(
                                                context)
                                            .copyWith(
                                                fontSize: 14, fontWeight: bold),
                                      ),
                                      Text(
                                        "${controller.dataProfil!.company.email}",
                                        style: ColorApp.secondColorTextStyly(
                                                context)
                                            .copyWith(
                                                fontSize: 14, fontWeight: bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    decoration:
                                        const BoxDecoration(color: greyColor),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        No_Telepon,
                                        style: ColorApp.secondColorTextStyly(
                                                context)
                                            .copyWith(
                                                fontSize: 14, fontWeight: bold),
                                      ),
                                      Text(
                                        " : ",
                                        style: ColorApp.secondColorTextStyly(
                                                context)
                                            .copyWith(
                                                fontSize: 14, fontWeight: bold),
                                      ),
                                      Text(
                                        "${controller.dataProfil!.company.phone}",
                                        style: ColorApp.secondColorTextStyly(
                                                context)
                                            .copyWith(
                                                fontSize: 14, fontWeight: bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 1,
                                    width: double.infinity,
                                    decoration:
                                        const BoxDecoration(color: greyColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ))
              ],
            );
          }
        }),
        );
  }
}
