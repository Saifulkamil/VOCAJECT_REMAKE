import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import Model dan Controller yang digunakan
import '../../../controllers/authController.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/colors.dart';
import '../../../utils/component/widget_btn_custom.dart';
import '../../../utils/component/widget_text_button.dart';
import '../../../utils/component/widget_text_formField.dart';
import '../../../utils/string.dart';
import '../controllers/login_controller.dart';

// View untuk halaman Login
class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  // Fungsi untuk membuat tampilan halaman Login
  @override
  Widget build(BuildContext context) {
    final loginC = Get.find<LoginController>();

    final currentHeight = MediaQuery.of(context).size.height;

    // Menentukan kisaran tinggi layar dan nilai buttom yang sesuai
    final heightRanges = {
      800: 5.0,
      826: 35.0,
      844: 65.0,
      873: 95.0,
      896: 125.0,
      915: 155.0,
    };

    // Mencari nilai buttom yang sesuai berdasarkan kisaran tinggi layar
    double buttom = 0.0;
    for (var height in heightRanges.keys) {
      if (currentHeight < height) {
        buttom = heightRanges[height]!;
        break;
      }
    }

    // Fungsi untuk membuat tampilan halaman Login
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: colorTransparan,
            elevation: 0,
            pinned: true,
            leading: null,
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
                  // Text Selamat Datang Kembali
                  Text(
                    selamat_datang_kembali,
                    style: ColorApp.greenTextStyly(context)
                        .copyWith(fontSize: 20, fontWeight: semiBold),
                  ),

                  // Text Kuy Masuk Lagi
                  Text(
                    Kuy_masuk_lagi,
                    style: ColorApp.secondColorTextStyly(context)
                        .copyWith(fontSize: 15, fontWeight: reguler),
                  ),
                  const SizedBox(
                    height: 12,
                  ),

                  // Container untuk form login
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text Email
                        Text(
                          Email,
                          style: ColorApp.secondColorTextStyly(context)
                              .copyWith(fontSize: 15, fontWeight: reguler),
                        ),
                        const SizedBox(height: 16),

                        // TextFormField untuk input email
                        WidgetTextFormField(
                          LoginC: loginC,
                          iconData: Icons.email,
                          text: Email,
                        ),
                        const SizedBox(height: 20),

                        // Text Kata Sandi
                        Text(
                          Kata_sandi,
                          style: ColorApp.secondColorTextStyly(context)
                              .copyWith(fontSize: 15, fontWeight: reguler),
                        ),
                        const SizedBox(height: 16),

                        // TextFormField untuk input kata sandi
                        Obx(() => TextFormField(
                              // validator: (value) {
                              //   if (value!.isEmpty) {
                              //     return "* Password Harus Di Masukan";
                              //   } else if (value.length < 8) {
                              //     return "* Password harus 8 huruf";
                              //   }

                              //   return null;
                              // },
                              cursorColor:
                                  Theme.of(context).colorScheme.secondary,
                              autocorrect: false,
                              controller: loginC.passC,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: loginC.isHidden.value,
                              decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    color: greyColor,
                                    onPressed: () {
                                      loginC.isHidden.toggle();
                                    },
                                    icon: Icon(loginC.isHidden.isFalse
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                  ),
                                  filled: true,
                                  // fillColor: ColorGrey,
                                  hintText: Kata_sandi,
                                  labelText: Kata_sandi,
                                  hintStyle:
                                      ColorApp.secondColorTextStyly(context)
                                          .copyWith(),
                                  labelStyle:
                                      ColorApp.secondColorTextStyly(context)
                                          .copyWith(),
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
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            WidgetTextButton(
                              text: Lupa_Kata_sandi,
                              onPressed: () {
                                Get.offAllNamed(Routes.RESET_PASSWORD);
                              },
                            )
                          ],
                        ),
                        const SizedBox(height: 5),

                        // Button untuk melakukan login
                        BtnCustom(
                          text: Masuk,
                          onPressed: () async {
                            // Melakukan login dan mendapatkan UserModel
                            // UserModel? user = await
                            final authC = Get.put(AuthController());

                            authC.getUserFromStorage();
                            final userdata = await authC.login(
                                loginC.emailC.text, loginC.passC.text);
                            if (userdata != null) {
                              Get.back();
                              Get.toNamed(Routes.NAVIGATIONBAR);
                            }
                            // Jika login berhasil dan UserModel tidak null, cetak email pengguna di debug console
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
                      // Text Belum punya akun
                      Text(Belum_punya_akun_gan,
                          style: ColorApp.secondColorTextStyly(context)
                              .copyWith(fontSize: 14, fontWeight: semiBold)),
                      // Button untuk daftar akun baru
                      WidgetTextButton(
                        text: Kuy_daftar,
                        onPressed: () {
                          // Get.toNamed(Routes.PICKROLE);
                          // authC.login();
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
