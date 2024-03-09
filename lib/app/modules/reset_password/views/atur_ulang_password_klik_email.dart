import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';

import '../../../utils/component/widget_appbar.dart';
import '../../../utils/string.dart';
import '../controllers/reset_password_controller.dart';
import 'atur_ulang_password_otp.dart';

class AturUlangPasswordklikEmail extends GetView<ResetPasswordController> {
  const AturUlangPasswordklikEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const AppbarTransparant(title: Pilih_Email),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Email,
                  style: ColorApp.greenTextStyly(context)
                      .copyWith(fontSize: 20, fontWeight: reguler),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  Pilih_Email_untuk_ubah_Kata_Sandi,
                  style: ColorApp.secondColorTextStyly(context)
                      .copyWith(fontSize: 15, fontWeight: reguler),
                ),
                const SizedBox(
                  height: 30,
                ),
                Material(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  child: InkWell(
                    onTap: () {
                      // forgetpassC.pickEmail();
                              Get.to(()=>const AturUlangPasswordOTP());
                      
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: greenColor,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const Icon(Icons.email_rounded,
                                color: greenColor, size: 50),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "forgetpassC",
                              style: ColorApp.secondColorTextStyly(context)
                                  .copyWith(fontSize: 15, fontWeight: reguler),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
