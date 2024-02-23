import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/component/widget_appbar.dart';
import '../../../utils/component/widget_btn_custom.dart';
import '../../../utils/string.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const AppbarTransparant(title: Profil_saya),
        body: GetX<EditProfileController>(builder: (controller) {
          if (!controller.isProjectLoaded.value) {
            // Jika data proyek belum dimuat, tampilkan loading atau indikator lainnya
            return const Center(child: CircularProgressIndicator());
          } else {
            return Padding(
                padding: const EdgeInsets.all(15),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child:
                                  // Obx(
                                  //   () =>
                                  InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 167,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .background,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
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
                                              height: 15,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 30.0,
                                                      vertical: 10),
                                              child: Column(
                                                children: [
                                                  Material(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .background,
                                                    child: InkWell(
                                                      onTap: () {
                                                        // profileC.pilihfoto();
                                                      },
                                                      child: Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.image,
                                                            size: 30,
                                                            color: greyColor,
                                                          ),
                                                          const SizedBox(
                                                            width: 30,
                                                          ),
                                                          Text(
                                                            Ambil_foto_dari_galeri,
                                                            style: ColorApp
                                                                    .secondColorTextStyly(
                                                                        context)
                                                                .copyWith(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        reguler),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 30,
                                                  ),
                                                  Material(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .background,
                                                    child: InkWell(
                                                      onTap: () {
                                                        // profileC.ambilfoto();
                                                      },
                                                      child: Row(
                                                        children: [
                                                          const Icon(
                                                            Icons.camera_alt,
                                                            color: greyColor,
                                                            size: 30,
                                                          ),
                                                          const SizedBox(
                                                            width: 30,
                                                          ),
                                                          Text(
                                                            Ambil_foto_dari_kamera,
                                                            style: ColorApp
                                                                    .secondColorTextStyly(
                                                                        context)
                                                                .copyWith(
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        reguler),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Stack(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage:
                                          // profileC.isprofilepath.value == true &&
                                          //         profileC.isprofilepath.value != null
                                          //     ? FileImage(File(profileC.profilepathpicture.value))
                                          //         as ImageProvider
                                          //     :
                                          NetworkImage(
                                              "${controller.dataProfil!.data.user.picture}"),
                                      backgroundColor: greyColor,
                                      radius: 50,
                                      child: CircleAvatar(
                                          radius: 50,
                                          backgroundColor: blackColor30,
                                          child: Icon(
                                            Icons.camera_alt_outlined,
                                            color: whiteColor,
                                            size: 35,
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                              // ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  textCapitalization: TextCapitalization.words,
                                  controller: controller.nameC,
                                  cursorColor: greyColor,
                                  decoration: InputDecoration(
                                      label: Text(Nama,
                                          style: ColorApp.secondColorTextStyly(
                                                  context)
                                              .copyWith(
                                                  fontSize: 15,
                                                  fontWeight: light)),
                                      hintStyle:
                                          ColorApp.secondColorTextStyly(context)
                                              .copyWith(),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: greyColor),
                                      ),
                                      hintText: Nama),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  textCapitalization: TextCapitalization.words,
                                  controller: controller.phoneC,
                                  keyboardType: TextInputType.number,
                                  cursorColor: greyColor,
                                  decoration: InputDecoration(
                                      label: Text(No_Telepon,
                                          style: ColorApp.secondColorTextStyly(
                                                  context)
                                              .copyWith(
                                                  fontSize: 15,
                                                  fontWeight: light)),
                                      hintStyle:
                                          ColorApp.secondColorTextStyly(context)
                                              .copyWith(),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: greyColor),
                                      ),
                                      hintText: Nama),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  minLines: 1,
                                  maxLines: 5,
                                  textCapitalization: TextCapitalization.words,
                                  controller: controller.alamatC,
                                  cursorColor: greyColor,
                                  decoration: InputDecoration(
                                      label: Text(Alamat,
                                          style: ColorApp.secondColorTextStyly(
                                                  context)
                                              .copyWith(
                                                  fontSize: 15,
                                                  fontWeight: light)),
                                      hintStyle:
                                          ColorApp.secondColorTextStyly(context)
                                              .copyWith(),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: greyColor),
                                      ),
                                      hintText: Nama),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Center(
                                    child: BtnCustom(
                                  text: simpan,
                                  onPressed: () {},
                                )),
                              ],
                            )
                          ]),
                    )
                  ],
                ));
          }
        }));
  }
}
