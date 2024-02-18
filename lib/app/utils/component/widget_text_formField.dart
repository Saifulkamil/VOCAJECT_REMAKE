// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

import '../../modules/login/controllers/login_controller.dart';
import '../colors.dart';

class WidgetTextFormField extends StatelessWidget {
  //untuk text pada button
  final String text;
  final LoginController LoginC;
  //untuk icon prefix textform
  final IconData iconData;

  const WidgetTextFormField({
    required this.iconData,
    required this.LoginC,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: (value) {
      //   if (value!.isEmpty) {
      //     return "* Email Harus Di Masukan";
      //   }

      //   final emailRegex = RegExp(
      //       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      //   if (!emailRegex.hasMatch(value)) {
      //     return "* Masukan email yang benar";
      //   }
      //   return null;
      // },
      cursorColor: Theme.of(context).colorScheme.secondary,
      autocorrect: false,
      controller: LoginC.emailC,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          filled: true,
          labelText: text,
          hintText: text,
          prefixIcon: Icon(iconData),
          prefixIconColor: greyColor,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10.0),
          hintStyle: ColorApp.secondColorTextStyly(context).copyWith(),
          labelStyle: ColorApp.secondColorTextStyly(context).copyWith(),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.secondary),
            borderRadius: BorderRadius.circular(8),
          )),
    );
  }
}
