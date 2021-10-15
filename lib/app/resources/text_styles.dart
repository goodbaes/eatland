import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webapp/app/resources/app_colors.dart';

class AppText {
  static TextStyle caption = GoogleFonts.josefinSans(
    color: AppColors.darkColor,
    fontWeight: FontWeight.w800,
    fontSize: 10,
  );
  static TextStyle bodyBold = GoogleFonts.josefinSans(
    color: Colors.black,
    fontWeight: FontWeight.w900,
    fontSize: 16,
  );
  static TextStyle burgerMenuItemLabelinActive = GoogleFonts.josefinSans(
    color: AppColors.lightColor,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );
  static TextStyle burgerMenuItemLabelinInActive = GoogleFonts.josefinSans(
    color: AppColors.darkColor,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );
  static TextStyle h1 = GoogleFonts.josefinSans(
    fontWeight: FontWeight.w900,
    fontSize: 50,
    color: AppColors.textBlackColor,
  );
  static TextStyle h5 = GoogleFonts.josefinSans(
    fontWeight: FontWeight.w900,
    fontSize: 20,
    color: AppColors.textBlackColor,
  );
  static TextStyle h4 = GoogleFonts.josefinSans(
    fontWeight: FontWeight.w900,
    fontSize: 26,
    color: AppColors.textBlackColor,
  );
  static TextStyle h0 = GoogleFonts.josefinSans(
    fontWeight: FontWeight.w900,
    fontSize: 70,
    color: AppColors.textBlackColor,
  );
}
