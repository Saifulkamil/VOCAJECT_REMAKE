import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:vocaject_remake_v1/app/routes/app_pages.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';
import 'package:vocaject_remake_v1/app/utils/component/widget_success.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

import '../../controllers/fungsi_widget_random.dart';
import '../../modules/logbook/controllers/logbook_controller.dart';

class WidgetBuatLogbook extends StatelessWidget {
  const WidgetBuatLogbook({
    super.key,
    required this.projectC,
  });

  final LogbookController projectC;

  @override
  Widget build(BuildContext context) {
    final flowC = Get.put(WidgetController());

    return Container(
      height: 702,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Form(
            key: projectC.formkey,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LogBook,
                      style: ColorApp.secondColorTextStyly(context)
                          .copyWith(fontSize: 20, fontWeight: medium),
                    ),
                    TextButton(
                        onPressed: () {
                          if (projectC.formkey.currentState!.validate()) {
                            projectC.createProjectLogbook(
                                projectC.selectedDate.value,
                                projectC.logbookC.text);
                                    flowC.Loading();

                            Timer(const Duration(milliseconds: 1500), () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                builder: (BuildContext context) {
                                  return WidgetSuccess(
                                    text: Kamu_Berhasil_Membuat_Catatan_baru,
                                    onPressed: () {
                                      Get.back();
                                      Get.back();
                                      Get.back();
                                    },
                                  );
                                },
                              );
                            });
                            projectC.isProjectLoaded.value = false;
                          }
                          ;
                        },
                        child: Text(
                          simpan,
                          style: ColorApp.greenTextStyly(context)
                              .copyWith(fontSize: 18, fontWeight: reguler),
                        ))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  Tanggal_Penyerahan_Logbook,
                  style: ColorApp.secondColorTextStyly(context)
                      .copyWith(fontSize: 15, fontWeight: reguler),
                ),
                const SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    projectC.selectDate(context);
                  },
                  child: Container(
                    height: 52,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(8)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(children: [
                            Obx(() {
                              String formattedDate = DateFormat('yyyy-MM-dd')
                                  .format(projectC.selectedDate.value);
                              return Text(
                                formattedDate,
                                style: ColorApp.secondColorTextStyly(context)
                                    .copyWith(fontSize: 15, fontWeight: medium),
                              );
                            })
                          ]),
                          const Icon(
                            Icons.date_range_sharp,
                            color: greenColor,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  Isi_logbook,
                  style: ColorApp.secondColorTextStyly(context)
                      .copyWith(fontSize: 15, fontWeight: reguler),
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
                          return "* LogBook Harus Di Masukan";
                        }
                        return null;
                      },
                      controller: projectC.logbookC,
                      keyboardType: TextInputType.text,
                      minLines: 5,
                      maxLines: 15,
                      cursorColor: Theme.of(context).colorScheme.secondary,
                      textAlign: TextAlign.justify,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: colorTransparan,
                          hintText: Ketikkan_Logbook_anda,
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
