import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../modules/login/views/login_view.dart';


class Mobile1 extends GetView<StatelessWidget> {
  const Mobile1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const LoginView();
  }
}
