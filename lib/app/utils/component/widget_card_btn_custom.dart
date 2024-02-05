import 'package:flutter/material.dart';
import 'package:vocaject_remake_v1/app/utils/colors.dart';

class WidgetCardBtnCustom extends StatelessWidget {
//untuk text pada button
  final String text;
  final String image;
  final VoidCallback onPressed;

  const WidgetCardBtnCustom({
    required this.text,
    required this.image,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: colorTransparan,
      child: InkWell(
        onTap: ()=>
          onPressed(),        
        child: Card(
          color: Theme.of(context).colorScheme.secondaryContainer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Container(
            height: 80,
            width: 80,
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Column(
              children: [
                Image.asset(
                  image,
                  height: 50,
                  width: 50,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  text,
                  style: ColorApp.secondColorTextStyly(context)
                      .copyWith(fontSize: 12, fontWeight: medium),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
