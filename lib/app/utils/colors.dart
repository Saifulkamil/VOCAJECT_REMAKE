// ignore_for_file: unused_local_variable

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

const greenColor = Color(0xFF20DAD7);
const greenColor20 = Color(0x3320DAD7);
const greenColor30 = Color(0x04d0dad7);
const greenAppBar = Color(0xFF176878);
const colorTransparan = Colors.transparent;
const backgrondColor = Color(0xFFF1F1F1);
const backgrondColorchat = Color(0xFFE9E9E9);
const blackColor30 = Color(0x4D333333);
const blackColor10 = Color(0x1A333333);
const blackColor = Color(0xFF333333);
const blackColor50 = Color(0x80333333);
const whiteColor = Color(0xFFFFFFFF);
const whiteColor50 = Color(0x4DFFFFFF);
const greenColor2 = Color(0xFF79C7C6);
const greyColor = Colors.grey;
const redcolor = Color(0xFFD11818);
const greenchecklistColor = Color(0xFF18D136);

TextStyle redTextStyly = GoogleFonts.poppins(color: redcolor);

TextStyle blackTextStyly = GoogleFonts.poppins(color: blackColor);

TextStyle whiteTextStyly = GoogleFonts.poppins(color: whiteColor);

TextStyle black50TextStyly = GoogleFonts.poppins(color: blackColor50);

FontWeight light = FontWeight.w300;
FontWeight reguler = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight blackBlod = FontWeight.w900;

class ColorApp {
  static TextStyle greenTextStyly(BuildContext context) {
    return GoogleFonts.poppins(
      color: Theme.of(context).colorScheme.primary,
    );
  }

  static TextStyle green2TextStyly(BuildContext context) {
    return GoogleFonts.poppins(
      color: Theme.of(context).colorScheme.onSecondary,
    );
  }
  
  static TextStyle WhiteTextStyly(BuildContext context) {
    return GoogleFonts.poppins(
      color: Theme.of(context).colorScheme.secondary,
    );
  }
}