import 'package:flutter/material.dart';

import '../colors.dart';
import '../string.dart';
// import 'package:get/get.dart';

class WidgetCariTextFromField extends StatelessWidget {
  const WidgetCariTextFromField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          color: blackColor10, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: TextFormField(
          cursorColor: blackColor10,
          textAlign: TextAlign.justify,
          decoration: InputDecoration(
              filled: true,
              fillColor: colorTransparan,
              hintText: Cari_Proyek_anda_inginkan,
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
              prefixIcon: const Icon(
                Icons.search,
                color: blackColor,
              ),
              hintStyle: const TextStyle(color: greyColor),
              labelStyle: const TextStyle(color: blackColor),
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: colorTransparan),
                borderRadius: BorderRadius.circular(8),
              )),
        ),
      ),
    );
    // TextFormField(
    //   autocorrect: false,

    //   keyboardType: TextInputType.emailAddress,
    //   decoration: InputDecoration(
    //       filled: true,
    //       fillColor: Colors.white,
    //       hintText: Cari_Proyek_anda_inginkan,

    //       contentPadding:
    //           const EdgeInsets.symmetric(horizontal: 10.0),
    //
    // );
  }
}

// onFieldSubmitted: (value) {

//   if (value.isNotEmpty) {
//   Get.to(() => SearchView(valueSearch: value));

//   }
//   print(value);
// },
// onTapOutside: (event) {
//   FocusScope.of(context).unfocus();
// },
// controller: controller.emailC,
