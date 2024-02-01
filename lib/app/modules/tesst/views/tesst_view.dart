import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tesst_controller.dart';

class TesstView extends GetView<TesstController> {
  const TesstView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TesstView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TesstView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
