import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/langued_controller.dart';

class LanguedView extends GetView<LanguedController> {
  const LanguedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LanguedView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LanguedView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
