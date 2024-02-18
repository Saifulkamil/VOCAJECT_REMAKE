
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';
import 'package:vocaject_remake_v1/app/utils/component/widget_success.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

import '../../modules/project_details/controllers/project_details_controller.dart';
import '../../routes/app_pages.dart';

class WidgetFailed extends GetView<ProjectDetailsController> {
  const WidgetFailed({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 402,
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
                child: Image.asset(
                  "assets/image/img_tidak_bisa.png",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                Kamu_sudah_mengajukan_untuk_project_ini_sebelumnya,
                textAlign: TextAlign.center,
                style: ColorApp.secondColorTextStyly(context)
                    .copyWith(fontSize: 20, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  Yok_cari_project_lain_yang_sesuai_dengan_mu,
                  style: ColorApp.secondColorTextStyly(context)
                      .copyWith(fontSize: 15, fontWeight: reguler),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        builder: (BuildContext context) {
                          return WidgetSuccess(
                            text: Yeii_berhasil_Mengajukan_Proposal,
                            onPressed: () {
                              Get.toNamed(Routes.NAVIGATIONBAR);
                            },
                          );
                        },
                      );
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
                            fontSize: 18, fontWeight: bold)),
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
