// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors.dart';


// appbar dengan tombol back
class AppbarTransparant extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const AppbarTransparant({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorTransparan,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon:  Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.secondary,
          )),
      title: Text(
        title,
        style: ColorApp.secondColorTextStyly(context).copyWith(fontWeight: reguler),
      ),
    );
  }
}

// appbar tanpa tombol back
class AppbarNoLeading extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  const AppbarNoLeading({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorTransparan,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: ColorApp.secondColorTextStyly(context).copyWith(fontWeight: light),
      ),
    );
  }
}
