import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetOpenImage extends StatelessWidget {
  const WidgetOpenImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back)),
              const SizedBox(
                height: 60,
              ),
              Image.asset('assets/image/img_vocaject.png'),
            ],
          ),
        ),
      ),
    );
  }
}
