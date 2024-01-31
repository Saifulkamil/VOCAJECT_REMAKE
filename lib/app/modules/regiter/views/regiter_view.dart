import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/regiter_controller.dart';

class RegiterView extends GetView<RegiterController> {
  const RegiterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegiterView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RegiterView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
