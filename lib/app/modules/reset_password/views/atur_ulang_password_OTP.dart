import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';

import '../../../utils/component/widget_appbar.dart';
import '../../../utils/string.dart';
import '../controllers/reset_password_controller.dart';
import 'atur_ulang_password_baru.dart';

class AturUlangPasswordOTP extends GetView<ResetPasswordController> {
  const AturUlangPasswordOTP({Key? key}) : super(key: key);

  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: const AppbarTransparant(title: Verifikasi_kode_OTP),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Masuk_Kode_OTP,
                  style: ColorApp.greenTextStyly(context)
                      .copyWith(fontSize: 20, fontWeight: reguler),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  Silahkan_Cek_Email_Anda_Untuk_Kode_Verifikasi,
                  style: ColorApp.secondColorTextStyly(context)
                      .copyWith(fontSize: 15, fontWeight: reguler),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.number,
                  // controller: forgetpassC.kodeC,
                  cursorColor: greyColor,
                  decoration: const InputDecoration(
                      label: Text(Kode_OTP,
                          style: TextStyle(
                              fontFamily: "poppins", color: greyColor)),
                      contentPadding: EdgeInsets.symmetric(vertical: 1),
                      hintStyle: TextStyle(fontFamily: "poppins"),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: greyColor),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: greyColor),
                      ),
                      hintText: Kode_OTP),
                ),
                const SizedBox(
                  height: 35,
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // forgetpassC.checkOTP(forgetpassC.kodeC.text);
                            Get.to(() => const AturUlangPasswordBaru());
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              elevation: MaterialStateProperty.all(4),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(greenColor)),
                          child: Text(
                            Verifikasi,
                            style: whiteTextStyly.copyWith(
                                fontSize: 20, fontWeight: reguler),
                          ),
                        ))),
              ],
            ),
          ),
        ));
  }
}
