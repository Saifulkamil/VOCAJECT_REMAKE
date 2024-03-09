import 'dart:async';

import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';
import 'package:vocaject_remake_v1/app/utils/component/widget_failed.dart';
import 'package:vocaject_remake_v1/app/utils/component/widget_success.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

import '../../modules/project_details/controllers/project_details_controller.dart';
import '../../routes/app_pages.dart';

class Widgetkonfirm extends GetView<ProjectDetailsController> {
  const Widgetkonfirm({
    super.key,
    required this.projectDetailsController,
  });
  final ProjectDetailsController projectDetailsController;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 422,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Center(
                  child: Container(
                    height: 5,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: greyColor),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: DotLottieLoader.fromAsset(
                      "assets/animation/attantion.lottie",
                      frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                    if (dotlottie != null) {
                      return Lottie.memory(dotlottie.animations.values.single);
                    } else {
                      return Container();
                    }
                  }),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                Kamu_sudah_yakin_untuk_project_ini,
                textAlign: TextAlign.center,
                style: ColorApp.secondColorTextStyly(context)
                    .copyWith(fontSize: 20, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  Kalau_sudah_Dikonfirmasi,
                  textAlign: TextAlign.center,
                  style: ColorApp.secondColorTextStyly(context)
                      .copyWith(fontSize: 15, fontWeight: reguler),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: colorTransparan,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: const BorderSide(color: greenColor),
                            )),
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                colorTransparan)),
                        child: Text(Cek_Lagi_Dehh,
                            style: ColorApp.secondColorTextStyly(context)
                                .copyWith(fontSize: 15, fontWeight: reguler)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        await projectDetailsController.createProject(
                          projectDetailsController.noteC.text,
                          projectDetailsController.selectedMahasiswa,
                        );
                        if (projectDetailsController.responseStatusCode ==
                            200) {
                          Timer(const Duration(milliseconds: 1500), () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              builder: (BuildContext context) {
                                return WidgetSuccess(
                                  text: Yeii_berhasil_Mengajukan_Proposal,
                                  onPressed: () {
                                    Get.offAllNamed(Routes.NAVIGATIONBAR);
                                  },
                                );
                              },
                            );
                          });
                        } else if (projectDetailsController
                                    .responseStatusCode ==
                                400 ) {
                          Timer(const Duration(milliseconds: 1500), () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              builder: (BuildContext context) {
                                return WidgetFailedField(
                                    projectDetailsController:
                                        projectDetailsController);
                              },
                            );
                          });
                        }else if (projectDetailsController
                                .responseStatusCode ==
                            403) {
                          Timer(const Duration(milliseconds: 1500), () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              builder: (BuildContext context) {
                                return const WidgetFailed();
                              },
                            );
                          });
                        }
                      },
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                          elevation: MaterialStateProperty.all(4),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(greenColor2)),
                      child: Text(Oke_bang,
                          style: whiteTextStyly.copyWith(
                              fontSize: 15, fontWeight: bold)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
