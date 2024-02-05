import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';
import 'package:vocaject_remake_v1/app/utils/component/widget_appbar.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

import '../controllers/reset_password_controller.dart';
import 'atur_ulang_password_OTP.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  const ResetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: const AppbarTransparant(title: Lupa_Kata_sandi),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                   Atur_Ulang_Kata_Sandi,
                    style: ColorApp.greenTextStyly(context).copyWith(
                                        fontSize: 20, fontWeight: reguler),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    Masukkan_email_yang_terdaftar,
                    style:ColorApp.secondColorTextStyly(context).copyWith(
                                        fontSize: 15, fontWeight: reguler),
                  ),
                  Text(
                    Untuk_atur_ulang_kata_sandi,
                    style: ColorApp.secondColorTextStyly(context).copyWith(
                                        fontSize: 15, fontWeight: reguler),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  TextFormField(
                    // controller: forgetpassC.emailC,
                    cursorColor: greyColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        label: Text(Email,
                            style:ColorApp.secondColorTextStyly(context).copyWith(
                                        fontSize: 15, fontWeight: reguler),),
                        contentPadding: const EdgeInsets.symmetric(vertical: 1),
                        hintStyle: const TextStyle(fontFamily: "poppins"),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        hintText: Email),
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
                              // forgetpassC.sendEmail(forgetpassC.emailC.text);
                              Get.to(()=>const AturUlangPasswordOTP());
                            },
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
                            child:  Text(
                             lanjutkan,
                              style: whiteTextStyly.copyWith(
                                        fontSize: 20, fontWeight: semiBold),
                            ),
                          ))),
                ],
              ),
            ),
          ),
        );
  }
}
