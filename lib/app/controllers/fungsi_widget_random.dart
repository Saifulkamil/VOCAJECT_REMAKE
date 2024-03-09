import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class WidgetController extends GetxController {
  void loading(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content:  SizedBox(
            width: 50,
            height: 100,

            child: DotLottieLoader.fromAsset(
                        "assets/animation/loading.lottie",
                        frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                      if (dotlottie != null) {
                        return Lottie.memory(dotlottie.animations.values.single);
                      } else {
                        return Container();
                      }
                    }),
          )
         
        );
      },
    );
  }
}
