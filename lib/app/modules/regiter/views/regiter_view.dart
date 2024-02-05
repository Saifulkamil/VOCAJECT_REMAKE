import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';

import '../../../utils/component/widget_appbar.dart';
import '../../../utils/string.dart';
import '../controllers/regiter_controller.dart';

class RegiterView extends GetView<RegiterController> {
  const RegiterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final regisMhsC = Get.find<RegiterController>();
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppbarTransparant(title: "Daftar sebagai ${regisMhsC.role}"),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
                child: Theme(
              data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(primary: greenColor2)),
              child: Obx(
                () => Stepper(
                  // tipe stepper yaitu vertical
                  type: StepperType.vertical,
                  // pemanggilan List Stepper yang di buat pada controller  
                  steps: regisMhsC.viewStep(context),

                  // nilai isactive yang di buatpada list step
                  currentStep: regisMhsC.currentStep.value,

                  // logika untuk next ke stepper selajutnya
                  onStepContinue: () {
                    regisMhsC.currentStep.value++;
                  },

                  // logika untuk cencel ke stepper sebelumnya
                  onStepCancel: () {
                    regisMhsC.currentStep.value == 0
                        ? null
                        : regisMhsC.currentStep.value--;
                  },
                  controlsBuilder: (context, details) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ElevatedButton(
                              onPressed: details.onStepContinue,
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  elevation: MaterialStateProperty.all(4),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          greenColor)),
                              child: Text(
                                lanjutkan,
                                style: whiteTextStyly.copyWith(
                                    fontSize: 15, fontWeight: medium),
                              )),
                          const SizedBox(
                            width: 20,
                          ),
                          if (regisMhsC.currentStep.value != 0)
                            ElevatedButton(
                                onPressed: details.onStepCancel,
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    elevation: MaterialStateProperty.all(4),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            greyColor)),
                                child:  Text(
                                  Kembali,
                                  style: whiteTextStyly.copyWith(
                                    fontSize: 15, fontWeight: medium),
                                ))
                        ],
                      ),
                    );
                  },
                ),
              ),
            )),
          ],
        ));
  }
}
