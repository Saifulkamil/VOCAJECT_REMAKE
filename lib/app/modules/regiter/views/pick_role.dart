import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/colors.dart';
import '../../../utils/component/widget_card_btn_custom.dart';
import '../../../utils/string.dart';
import '../controllers/regiter_controller.dart';

class PickRoleScreen extends GetView<RegiterController> {
  const PickRoleScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text(Pilih_Role),
          elevation: 0,
          backgroundColor: colorTransparan,
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        Silahkan_pilih_peran_yang_akan_didaftarkan,
                        style: ColorApp.secondColorTextStyly(context)
                            .copyWith(fontSize: 15, fontWeight: reguler),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              // widget card
                              // dengan contractor text, path image dan action onpress
                              WidgetCardBtnCustom(
                                text: Mahasiswa,
                                image: "assets/image/img_mahasiswa.png",
                                onPressed: () {

                                  // mengirim argument ke controler register
                                  Get.toNamed(Routes.REGITER, arguments: Mahasiswa);
                                },
                              ),

                               // widget card
                              // dengan contractor text, path image dan action onpress
                              WidgetCardBtnCustom(
                                text: Dosen,
                                image: "assets/image/img_dosen.png",
                                onPressed: () {
                                   // mengirim argument ke controler register
                                  Get.toNamed(Routes.REGITER, arguments: Dosen);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                               // widget card
                              // dengan contractor text, path image dan action onpress
                              WidgetCardBtnCustom(
                                text: Industri,
                                image: "assets/image/img_industri.png",
                                onPressed: () {
                                   // mengirim argument ke controler register
                                  Get.toNamed(Routes.REGITER, arguments: Industri);},
                              ),

                               // widget card
                              // dengan contractor text, path image dan action onpress
                              WidgetCardBtnCustom(
                                text: Kampus,
                                image: "assets/image/img_school.png",
                                onPressed: () { // mengirim argument ke controler register
                                  Get.toNamed(Routes.REGITER, arguments: Kampus);}
                              ),
                            ],
                          ),
                        ],
                      )
                    ]))));
  }
}
