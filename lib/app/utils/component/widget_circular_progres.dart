import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';

class CircularProgres extends StatelessWidget {
  const CircularProgres({
    required this.progres,
    super.key,
  });
  final double progres;
  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      radius: 80.0,
      lineWidth: 20.5,
      percent: progres,
      center: Text(
        "${progres.toInt()}%",
        style: ColorApp.secondColorTextStyly(context).copyWith(fontSize: 35),
      ),
      progressColor: greenColor,
      backgroundColor: greenColor20,
    );
  }
}
