import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';

class CircularProgres extends StatelessWidget {
  const CircularProgres({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 80.0,
      lineWidth: 20.5,
      percent: 0.60,
      center: Text(
        "60%",
        style: ColorApp.secondColorTextStyly(context).copyWith(fontSize: 35),
      ),
      progressColor: greenColor,
      backgroundColor: greenColor20,
    );
  }
}
