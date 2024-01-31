import 'package:flutter/material.dart';

import '../colors.dart';

class WidgetTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  
  const WidgetTextButton({ required this.onPressed,  required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text,
          style: ColorApp.green2TextStyly(context).copyWith(
              fontSize: 14, fontWeight: semiBold)),
    );
  }
}