import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../utils/colors.dart';
import '../../../utils/component/widget_btn_custom.dart';
import '../../../utils/component/widget_text_button.dart';
import '../../../utils/component/widget_text_formField.dart';
import '../../../utils/dark_theme.dart';
import '../../../utils/light_theme.dart';
import '../../../utils/string.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final loginC = Get.find<LoginController>();
    double buttom = 0.0;
    final currentheight = MediaQuery.of(context).size.height;
    if (currentheight < 800) {
      buttom = 5.0;
      // screen  390×844
    } else if (currentheight < 826) {
      buttom = 35.0;
      // screen  414×896
    } else if (currentheight < 844) {
      buttom = 65.0;
      // screen  414×896
    } else if (currentheight < 873) {
      buttom = 95.0;

      // screen 393×873
    } else if (currentheight < 896) {
      buttom = 125.0;

      // screen 412×915
    } else if (currentheight < 915) {
      buttom = 155.0;
    }
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // appBar: appBarTransparan(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: colorTransparan,
            elevation: 0,
            pinned: true,
            // floating: true,
            leading: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                  color: Theme.of(context).colorScheme.secondary,
                )),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(top: 60, left: 50, right: 50),
                child: Center(
                  child: Image.asset(
                    "assets/image/img_vocaject.png",
                  ),
                ),
              ),
            ),

            expandedHeight: 227,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              // child: Form(
              //   autovalidateMode: AutovalidateMode.onUserInteraction,
              //   key: loginc.formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    selamat_datang_kembali,
                    style: ColorApp.greenTextStyly(context)
                        .copyWith(fontSize: 20, fontWeight: semiBold),
                  ),
                  Text(
                    Kuy_masuk_lagi,
                    style: ColorApp.WhiteTextStyly(context)
                        .copyWith(fontSize: 15, fontWeight: reguler),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Email,
                          style: ColorApp.WhiteTextStyly(context)
                              .copyWith(fontSize: 15, fontWeight: reguler),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const WidgetTextFormField(
                            iconData: Icons.email, text: Email),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          Kata_sandi,
                          style: ColorApp.WhiteTextStyly(context)
                              .copyWith(fontSize: 15, fontWeight: reguler),
                        ),
                        const SizedBox(
                          height: 16,
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
                          cursorColor: Theme.of(context).colorScheme.secondary,
                          autocorrect: false,
                          // controller: loginc.passC,
                          keyboardType: TextInputType.visiblePassword,
                          // obscureText: loginC.isHidden.value,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                color: Theme.of(context).colorScheme.secondary,
                                onPressed: () {
                                  // loginC.isHidden.toggle();
                                },
                                icon: Icon(
                                    // loginC.isHidden.isFalse
                                    //     ? Icons.visibility_off
                                    //     :
                                    Icons.visibility),
                              ),
                              filled: true,
                              // fillColor: ColorGrey,
                              hintText: Kata_sandi,
                              labelText: Kata_sandi,
                              hintStyle:
                                  ColorApp.WhiteTextStyly(context).copyWith(),
                              labelStyle:
                                  ColorApp.WhiteTextStyly(context).copyWith(),
                              prefixIcon: const Icon(Icons.key),
                              prefixIconColor: Colors.grey,
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary),
                                borderRadius: BorderRadius.circular(8),
                              )),
                          // )
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            WidgetTextButton(
                              text: Lupa_Kata_sandi,
                              onPressed: () {
                                // Get.offNamed(Routes.PICKREGIROLE);
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        BtnCustom(
                          text: Masuk,
                          onPressed: () {
                            // Ganti dengan logika navigasi yang sesuai
                            // Get.toNamed(Routes.NAVIGATIONBAR);
                            Get.changeTheme(
                                Get.isDarkMode ? lightTheme : darkTheme);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(Belum_punya_akun_gan,
                          style: ColorApp.WhiteTextStyly(context)
                              .copyWith(fontSize: 14, fontWeight: semiBold)),
                      WidgetTextButton(
                        text: Kuy_daftar,
                        onPressed: () {
                          // Get.toNamed(Routes.PAGE_DAFTAR);
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: buttom,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
