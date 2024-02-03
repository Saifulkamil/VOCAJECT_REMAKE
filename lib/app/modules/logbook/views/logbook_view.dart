import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/logbook_controller.dart';

class LogbookView extends GetView<LogbookController> {
  const LogbookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LogbookView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LogbookView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
