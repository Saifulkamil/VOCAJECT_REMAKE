import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';
import 'package:vocaject_remake_v1/app/utils/component/widget_appbar.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

import '../../../routes/app_pages.dart';
import '../controllers/reset_password_controller.dart';

class AturUlangPasswordBaru extends GetView<ResetPasswordController> {
  const AturUlangPasswordBaru({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: const AppbarTransparant(title: Atur_Ulang_Kata_Sandi),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child:
              // Form(
              //   key: forgetpassC.formkey,
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              //   child:
              Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                kata_sandi_Baru,
                style: ColorApp.greenTextStyly(context)
                    .copyWith(fontSize: 20, fontWeight: reguler),
              ),
              const SizedBox(
                height: 35,
              ),
              Text(
                Buat_kata_Sandi_Yang_Baru_Untuk_Akun_Dengan_email,
                style: ColorApp.secondColorTextStyly(context)
                    .copyWith(fontSize: 15, fontWeight: reguler),
              ),
              const SizedBox(
                height: 25,
              ),
              // Obx(() =>
              TextFormField(
                // validator: (value) {
                //   if (value!.isEmpty) {
                //     return "* Password Harus Di Masukan";
                //   } else if (value.length < 8) {
                //     return "* Password harus 8 huruf";
                //   }

                //   return null;
                // },
                // obscureText: forgetpassC.ishidden1.value,
                textCapitalization: TextCapitalization.words,
                // controller: forgetpassC.passC,
                cursorColor: greyColor,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        color: Colors.black,
                        onPressed: () {
                          // forgetpassC.ishidden1.toggle();
                        },
                        icon: const Icon(
                            // forgetpassC.ishidden1.isFalse
                            // ? Icons.visibility_off
                            // :
                            Icons.visibility,color: greyColor,)),
                    label: Text(kata_sandi_Baru,
                        style: ColorApp.secondColorTextStyly(context)
                            .copyWith(fontWeight: reguler)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 1),
                    hintStyle: const TextStyle(fontFamily: "poppins"),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                    ),
                    hintText: kata_sandi_Baru),
                // )
              ),
              const SizedBox(
                height: 15,
              ),
              // Obx(() =>
              TextFormField(
                // validator: (vpass) {
                //   if (vpass == null || vpass.isEmpty) {
                //     return "* Sandi Tidak Boleh kosong";
                //   } else if (vpass.length < 8) {
                //     return "* Sandi harus 8 huruf";
                //   } else if (vpass != forgetpassC.passC.text) {
                //     return "* Sandi Tidak Sesuai";
                //   }
                //   return null;
                // },
                // obscureText: forgetpassC.ishidden2.value,
                // cursorColor: grey,
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                        color: Colors.black,
                        onPressed: () {
                          // forgetpassC.ishidden2.toggle();
                        },
                        icon: const Icon(
                            // forgetpassC.ishidden2.isFalse
                            //   ? Icons.visibility_off
                            //   :
                            Icons.visibility,color: greyColor)),
                    label: Text(Konfirmasi_kata_sandi,
                        style: ColorApp.secondColorTextStyly(context)
                            .copyWith(fontWeight: reguler)),
                    contentPadding: const EdgeInsets.symmetric(vertical: 1),
                    hintStyle: const TextStyle(fontFamily: "poppins"),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                    ),
                    hintText: Konfirmasi_kata_sandi),
                // )
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(68, 139, 230, 228),
                    border: Border.all(
                      color: greenColor,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.warning_rounded,
                        color: greenColor,
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          Setelah_Kata_Sandi_Di_Ubah,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: ColorApp.secondColorTextStyly(context)
                              .copyWith(fontSize: 12, fontWeight: reguler),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // if (forgetpassC.formkey.currentState!
                          //     .validate()) {
                          //   forgetpassC.resetpass(forgetpassC.passC.text);
                          // }
                          Get.toNamed(Routes.LOGIN);
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
                          lanjutkan,
                          style: whiteTextStyly.copyWith(
                              fontSize: 20, fontWeight: reguler),
                        ),
                      ))),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
