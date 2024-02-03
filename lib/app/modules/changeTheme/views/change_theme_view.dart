
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';
import '../../../utils/colors.dart';
import '../controllers/change_theme_controller.dart';

class ChangeThemeView extends GetView<ChangeThemeController> {
  const ChangeThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeC = Get.put<ChangeThemeController>(ChangeThemeController());

    return Scaffold(
     appBar: AppBar(
          backgroundColor: colorTransparan,
          elevation: 0,
          title: Text(Target_Proyek,
              style:
                   ColorApp.secondColorTextStyly(context).copyWith(fontSize: 20, fontWeight: reguler)),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon:  Icon(
                Icons.arrow_back,
                color: Theme.of(context).colorScheme.secondary,
              )),
      ),
      body: Column(
        children: <Widget>[
          //  ListTile(
          //   title: Text('Gunakan Pengaturan HP-mu'),
          //   subtitle: Text(
          //     'Sesuaikan tampilan dengan mengikuti pengaturan di HP kamu.',
          //   ),
          //   leading: Radio(
          //     value: null,
          //     groupValue: themeC.radioPick.value,
          //     onChanged: (value) {
          //           themeC.toggleTheme(value as int);
          //         },
          //   ),
          // ),
          Obx(() => ListTile(
                title:  Text(Light_Mode, style: ColorApp.secondColorTextStyly(context)
                        .copyWith(fontSize: 15, fontWeight: semiBold),),
                subtitle:  Text(
                  descripsi_light,
                  style: ColorApp.secondColorTextStyly(context)
                        .copyWith(fontSize: 13, fontWeight: light),
                ),
                leading: Radio(
                  value: false,
                  groupValue: themeC.radioPick.value,
                  onChanged: (value) {
                    themeC.toggleTheme(value!);
                  },
                ),
              )),
          Obx(() => ListTile(
                title:  Text(Dark_Mode, style: ColorApp.secondColorTextStyly(context)
                        .copyWith(fontSize: 15, fontWeight: semiBold),),
                subtitle:  Text(
                  descripsi_dark,  style: ColorApp.secondColorTextStyly(context)
                        .copyWith(fontSize: 13, fontWeight: light),
                ),
                leading: Radio(
                  value: true,
                  groupValue: themeC.radioPick.value,
                  onChanged: (value) {
                    themeC.toggleTheme(value!);
                  },
                ),
              )),
        ],
      ),
    );
  }
}
