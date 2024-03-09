
import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vocaject_remake_v1/app/utils/component/widget_btn_custom.dart';
import 'package:vocaject_remake_v1/app/utils/string.dart';

import '../../modules/project_details/controllers/project_details_controller.dart';
import '../colors.dart';

class WidgetSuccess extends GetView<ProjectDetailsController> {
  //untuk text pada button
  final String text;

  // untuk action pada button
  final VoidCallback onPressed;

  const WidgetSuccess({
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.maxFinite,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 350,
                  height: 350,
                  child: DotLottieLoader.fromAsset(
                      "assets/animation/Succes.lottie",
                      frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                    if (dotlottie != null) {
                      return Lottie.memory(dotlottie.animations.values.single);
                    } else {
                      return Container();
                    }
                  })),
              Text(
                Mantul,
                textAlign: TextAlign.center,
                style:
                    ColorApp.secondColorTextStyly(context).copyWith(
                                fontSize: 25, fontWeight: medium)
              ),
              const SizedBox(
                height: 100,
              ),
              Text(
                text,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style:
                   ColorApp.secondColorTextStyly(context).copyWith(
                                fontSize: 18, fontWeight: reguler)
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: BtnCustom(text: Mantul, onPressed: () => onPressed()
                    ),
              )
            ],
          ),
        ));
  }
}
