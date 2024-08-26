import 'package:brasa_hacks_stone/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle title = GoogleFonts.urbanist(
    fontSize: 30,
    color: AppColors.black,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle subtile = GoogleFonts.urbanist(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );

  static final TextStyle logo = GoogleFonts.urbanist(
    fontSize: 38,
    color: AppColors.primary,
  );

  static final TextStyle button = GoogleFonts.urbanist(
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    fontSize: 15,
  );
  static final TextStyle link = GoogleFonts.urbanist(
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
    fontSize: 15,
  );
  static final TextStyle description = GoogleFonts.urbanist(fontSize: 24);
  static final TextStyle contador =
      GoogleFonts.urbanist(fontSize: 50, color: AppColors.primary);
}
