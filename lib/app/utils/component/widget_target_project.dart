import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/controllers/fungsi_widget_random.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';
import 'package:vocaject_remake_v1/app/utils/component/widget_success.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

import '../../routes/app_pages.dart';
import 'widget_buat_logbook.dart';

class WidgetTargetProject extends StatelessWidget {
  const WidgetTargetProject({
    super.key,
    required this.flowC,
  });

  final WidgetController flowC;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 502,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Tambahkan_target,
                    style: ColorApp.secondColorTextStyly(context)
                        .copyWith(fontSize: 20, fontWeight: medium),
                  ),
                  TextButton(
                      onPressed: () {
                        flowC.Loading();
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          builder: (BuildContext context) {
                            return WidgetSuccess(
                                text: Kamu_Berhasil_Membuat_Mimpi_baru,
                                onPressed: () {
                                  Get.toNamed(Routes.PROJECT_PROGRESS);
                                });
                          },
                        );
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
              Container(
                // height: 500,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: TextFormField(
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
                          borderSide: const BorderSide(color: colorTransparan),
                          borderRadius: BorderRadius.circular(8),
                        )),
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
