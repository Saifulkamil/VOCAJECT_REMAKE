import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: const Text('splashscreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'splashscreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
