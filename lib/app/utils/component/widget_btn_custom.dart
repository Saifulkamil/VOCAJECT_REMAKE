import 'package:flutter/material.dart';

import '../colors.dart';

class BtnCustom extends StatelessWidget {
  //untuk text pada button
  final String text;

  // untuk action pada button 
  final VoidCallback onPressed;

  const BtnCustom({
    required this.text, required this.onPressed,Key? key,}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed, 
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              elevation: MaterialStateProperty.all(4),
              backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).colorScheme.onSecondary,)),
          child: Text(text,
              style: whiteTextStyly.copyWith(fontSize: 20, fontWeight: bold)),
        ));
  }
}
