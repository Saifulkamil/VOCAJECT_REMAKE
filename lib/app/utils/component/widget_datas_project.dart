import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

import '../../routes/app_pages.dart';

class WidgetDatasProject extends StatelessWidget {
  const WidgetDatasProject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 502,
      decoration:  BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0),
                child: Center(
                  child: Container(
                    height: 5,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(
                                10),
                        color: greyColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Aplikasi_Vocaject,
                    style: ColorApp.secondColorTextStyly(context).copyWith(
                        fontSize: 15,
                        fontWeight: medium),
                  ),
                  Text(
                    price,
                    style: ColorApp.secondColorTextStyly(context).copyWith(
                        fontSize: 15,
                        fontWeight: medium),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                tanggal,
                style: ColorApp.secondColorTextStyly(context).copyWith(
                    fontSize: 12,
                    fontWeight: light),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 1,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: greyColor),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    Kategori_,
                    style: ColorApp.secondColorTextStyly(context).copyWith(
                        fontSize: 14,
                        fontWeight: bold),
                  ),
                  Text(
                    Kategori,
                    style: ColorApp.secondColorTextStyly(context).copyWith(
                        fontSize: 14,
                        fontWeight: bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 1,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: greyColor),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                deskripsi,
                style: ColorApp.secondColorTextStyly(context).copyWith(
                    fontSize: 14, fontWeight: bold),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                Isideskripsi,
                style: ColorApp.secondColorTextStyly(context).copyWith(
                    fontSize: 14,
                    height: 1.7,
                    fontWeight: reguler),
              ),
              const SizedBox(
                height: 15,
              ),
              Material(
                color: Theme.of(context).colorScheme.background,
                child: InkWell(
                  onTap: () {
                    // Get.to(() =>
                    //     ProfilindustribyProject(list: list, index: index));
                    Get.toNamed(Routes.PROFILE_INDUSTRI);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: greyColor),
                        borderRadius:
                            BorderRadius.circular(
                                10)),
                    height: MediaQuery.of(context)
                            .size
                            .height /
                        8,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(
                                  left: 10.0),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                backgroundImage:
                                    AssetImage(
                                        "assets/image/img_tesla.png"),
                                backgroundColor:
                                    greyColor,
                                radius: 30,
                              ),
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets
                                          .only(
                                          left:
                                              10.0,
                                          right: 1),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                    children: [
                                      Text(Politeknik_Negeri_Lhokseumawe,
                                          overflow:
                                              TextOverflow
                                                  .ellipsis,
                                          style: ColorApp.secondColorTextStyly(context).copyWith(
                                              fontSize:
                                                  15,
                                              fontWeight:
                                                  semiBold)),
                                      const SizedBox(
                                          height:
                                              5),
                                      Text(kota_Lhokseumawe_aceh,
                                          overflow:
                                              TextOverflow
                                                  .ellipsis,
                                          style: ColorApp.secondColorTextStyly(context).copyWith(
                                              fontSize:
                                                  15,
                                              fontWeight:
                                                  reguler)),
                                      const SizedBox(
                                          height:
                                              5),
                                      Text(informatika,
                                          overflow:
                                              TextOverflow
                                                  .ellipsis,
                                          style: ColorApp.secondColorTextStyly(context).copyWith(
                                              fontSize:
                                                  15,
                                              fontWeight:
                                                  reguler))
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
            ],
          ),
        ),
      ),
    );
  }
}
