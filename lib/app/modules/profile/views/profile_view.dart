import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/routes/app_pages.dart';

import '../../../utils/colors.dart';
import '../../../utils/string.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
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
                      height: 224,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(7),
                            bottomRight: Radius.circular(7)),
                        child: Image.asset(
                          Theme.of(context).brightness == Brightness.dark
                              ? "assets/image/img_dark.png"
                              : "assets/image/img_light.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 50,
                            color: colorTransparan,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                Profil_saya,
                                style: ColorApp.secondColorTextStyly(context)
                                    .copyWith(
                                        fontSize: 20, fontWeight: semiBold),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    const Stack(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assets/image/img_foto.jpg"),
                                          backgroundColor: Colors.grey,
                                          radius: 45,
                                        ),
                                        Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: CircleAvatar(
                                            backgroundColor: Colors.red,
                                            radius: 15,
                                            child: CircleAvatar(
                                              backgroundColor: blackColor,
                                              radius: 8,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 190,
                                          child: Text(
                                            Saiful_Kamil,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style:
                                                ColorApp.secondColorTextStyly(
                                                        context)
                                                    .copyWith(
                                                        fontSize: 20,
                                                        fontWeight: semiBold),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Text(
                                          no_nim,
                                          style: ColorApp.secondColorTextStyly(
                                                  context)
                                              .copyWith(
                                                  fontSize: 14,
                                                  fontWeight: reguler),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    Get.toNamed(Routes.EDIT_PROFILE);
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    size: 30,
                                    color: greyColor,
                                  ))
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          // Text(
                          //   Saldo,
                          //   style: blackTextStyly.copyWith(
                          //       fontSize: 15, fontWeight: medium),
                          // ),
                          // const SizedBox(height: 15),
                          // Container(
                          //   decoration: BoxDecoration(
                          //       color: whiteColor,
                          //       borderRadius: BorderRadius.circular(8)),
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(
                          //         left: 10.0, bottom: 10, top: 10),
                          //     child: Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceAround,
                          //         children: [
                          //           Column(
                          //             children: [
                          //               WidgetIconBtnCustom2(
                          //                 iconData: Icons.monetization_on,
                          //                 onPressed: () {},
                          //               ),
                          //               Text(price,
                          //                   style: black50TextStyly.copyWith(
                          //                       fontSize: 12, fontWeight: medium))
                          //             ],
                          //           ),
                          //           Container(
                          //             height: 37,
                          //             width: 2,
                          //             decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.circular(10),
                          //                 color: greyColor),
                          //           ),
                          //           Column(
                          //             children: [
                          //               WidgetIconBtnCustom2(
                          //                 iconData: Icons.cloud_upload_rounded,
                          //                 onPressed: () {},
                          //               ),
                          //               Text(Kirim_saldo,
                          //                   style: black50TextStyly.copyWith(
                          //                       fontSize: 12, fontWeight: medium))
                          //             ],
                          //           ),
                          //           Container(
                          //             height: 37,
                          //             width: 2,
                          //             decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.circular(10),
                          //                 color: greyColor),
                          //           ),
                          //           Column(
                          //             children: [
                          //               WidgetIconBtnCustom2(
                          //                 iconData: Icons.cloud_download_rounded,
                          //                 onPressed: () {},
                          //               ),
                          //               Text(Terima_saldo,
                          //                   style: black50TextStyly.copyWith(
                          //                       fontSize: 12, fontWeight: medium))
                          //             ],
                          //           ),
                          //         ]),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        Pengaturan,
                        style: ColorApp.secondColorTextStyly(context)
                            .copyWith(fontSize: 15, fontWeight: medium),
                      ),
                      const SizedBox(height: 15),
                      InkWell(
                        onTap: () {
                          // Get.to(() => aturulangPasswordklikEmail());
                        },
                        child: ListTile(
                          leading: const Icon(
                            Icons.key,
                            color: greyColor,
                          ),
                          title: Text(Ubah_kata_sandi,
                              style: ColorApp.secondColorTextStyly(context)
                                  .copyWith(fontSize: 17, fontWeight: reguler)),
                          trailing: Icon(
                            Icons.arrow_right,
                            size: 30,
                            color: Colors.blueGrey[900],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: greyColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // Get.to(() => aturulangPasswordklikEmail());
                        },
                        child: ListTile(
                          leading: const Icon(
                            Icons.translate,
                            color: greyColor,
                          ),
                          title: Text(Bahasa,
                              style: ColorApp.secondColorTextStyly(context)
                                  .copyWith(fontSize: 17, fontWeight: reguler)),
                          trailing: const Icon(
                            Icons.arrow_right,
                            size: 30,
                            color: greyColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: greyColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.CHANGE_THEME);
                        },
                        child: ListTile(
                          leading: const Icon(
                            Icons.wb_sunny,
                            color: greyColor,
                          ),
                          title: Text(Tema,
                              style: ColorApp.secondColorTextStyly(context)
                                  .copyWith(fontSize: 17, fontWeight: reguler)),
                          trailing: const Icon(
                            Icons.arrow_right,
                            size: 30,
                            color: greyColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: greyColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // profileC.aboutApp();
                        },
                        child: ListTile(
                          leading: const Icon(
                            Icons.info,
                            color: greyColor,
                          ),
                          title: Text(Tentang_aplikasi,
                              style: ColorApp.secondColorTextStyly(context)
                                  .copyWith(fontSize: 17, fontWeight: reguler)),
                          trailing: const Icon(
                            Icons.arrow_right,
                            size: 30,
                            color: greyColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: double.infinity,
                          height: 1,
                          color: greyColor,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          // controller.logout();
                        },
                        child: ListTile(
                          leading: const Icon(
                            Icons.logout_outlined,
                            color: redcolor,
                          ),
                          title: Text(Keluar,
                              style: redTextStyly.copyWith(
                                  fontSize: 17, fontWeight: reguler)),
                        ),
                      ),
                      Center(
                          child: Text(
                        "Vocaject\nV.2.1",
                        textAlign: TextAlign.center,
                        style: black50TextStyly.copyWith(
                            fontSize: 15, fontWeight: medium),
                      )),
                    ],
                  ),
                ),
              ],
            ))
          ],
        ));
  }
}
