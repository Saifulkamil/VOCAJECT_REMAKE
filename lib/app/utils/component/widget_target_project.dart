import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/controllers/fungsi_widget_random.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

import '../../modules/target_project/controllers/target_project_controller.dart';
import 'widget_success.dart';

class WidgetTargetProject extends StatelessWidget {
  const WidgetTargetProject({
    super.key,
    required this.flowC,
    required this.task,
    required this.teks,
    required this.teksEditing,
    required this.teskButom,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  final WidgetController flowC;
  final String teks;
  final String? teksEditing;
  final String teskButom;
  final TargetProjectController task;

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleTaskupdate =
        TextEditingController(text: teksEditing);

    return Container(
      height: 502,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Form(
            key: task.formkey,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      teks,
                      style: ColorApp.secondColorTextStyly(context)
                          .copyWith(fontSize: 20, fontWeight: medium),
                    ),
                    TextButton(
                        onPressed: () => onPressed(),
                        child: Text(
                          teskButom,
                          style: teskButom == "Hapus"
                              ? redTextStyly.copyWith(
                                  fontSize: 18, fontWeight: reguler)
                              : ColorApp.greenTextStyly(context)
                                  .copyWith(fontSize: 18, fontWeight: reguler),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  // height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "* Target Harus Di Masukan";
                        }
                        return null;
                      },
                      enabled: teskButom == "Hapus" ? false : true,
                      controller: teskButom == "Simpan"
                          ? task.titleTask
                          : titleTaskupdate,
                      minLines: 1,
                      maxLines: 5,
                      cursorColor: blackColor10,
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: colorTransparan,
                          hintText: Target_Proyek,
                          hintStyle: const TextStyle(color: greyColor),
                          labelStyle: const TextStyle(color: blackColor),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: colorTransparan),
                            borderRadius: BorderRadius.circular(8),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WidgetTargetProjectupdate extends StatelessWidget {
  const WidgetTargetProjectupdate({
    super.key,
    required this.flowC,
    required this.targetProjectController,
    required this.teks,
    required this.teksEditing,
    required this.teskButom,
    required this.taskId,
  });

  final WidgetController flowC;
  final String?teks;
  final String? teksEditing;
  final String teskButom;
  final TargetProjectController targetProjectController;
  final int? taskId;

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleTaskupdate =
        TextEditingController(text: teksEditing);

    return Container(
      height: 502,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Form(
            key: targetProjectController.formkey,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      teks!,
                      style: ColorApp.secondColorTextStyly(context)
                          .copyWith(fontSize: 20, fontWeight: medium),
                    ),
                    TextButton(
                        onPressed: () {
                          if (targetProjectController.formkey.currentState!
                              .validate()) {
                            targetProjectController.updateTargetProject(
                              titleTaskupdate.text,
                              taskId!,
                            );

                            if (targetProjectController.isProjectLoaded.value) {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                builder: (BuildContext context) {
                                  return WidgetSuccess(
                                    text: Kamu_Berhasil_Merubah_Mimpi_,
                                    onPressed: () {
                                      Get.back();
                                      Get.back();
                                    },
                                  );
                                },
                              );
                            } else {
                              const CircularProgressIndicator();
                            }
                            targetProjectController.isProjectLoaded.value =
                                false;
                          }
                        },
                        child: Text(
                          teskButom,
                          style: teskButom == "Hapus"
                              ? redTextStyly.copyWith(
                                  fontSize: 18, fontWeight: reguler)
                              : ColorApp.greenTextStyly(context)
                                  .copyWith(fontSize: 18, fontWeight: reguler),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  // height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "* Target Harus Di Masukan";
                        }
                        return null;
                      },
                      enabled: teskButom == "Hapus" ? false : true,
                      controller: teskButom == "Simpan"
                          ? targetProjectController.titleTask
                          : titleTaskupdate,
                      minLines: 1,
                      maxLines: 5,
                      cursorColor: blackColor10,
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: colorTransparan,
                          hintText: Target_Proyek,
                          hintStyle: const TextStyle(color: greyColor),
                          labelStyle: const TextStyle(color: blackColor),
                          border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: colorTransparan),
                            borderRadius: BorderRadius.circular(8),
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
