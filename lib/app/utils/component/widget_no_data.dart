import 'package:flutter/material.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';

class WidgetNoData extends StatelessWidget {
  const WidgetNoData({
    required this.text,
    required this.image,
    super.key,
  });
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Image.asset(
              image,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text,
            style: ColorApp.secondColorTextStyly(context)
                .copyWith(fontSize: 15, fontWeight: bold),
          ),
        ],
      ),
    );
  }
}
