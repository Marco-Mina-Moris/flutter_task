// import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primary = Color(0xFFC7FF0E);
  static const surfacePrimary = Colors.white;
  static const surfaceCard = Color(0xFFF4F4F4);
  static const surfaceSecondary = Color(0xFFEAEAEA);
  static const surfaceActions = Color(0xFFF4F4F4);
  static const neutral100 = Color(0xFF121212);
  static const neutral400 = Color(0xFF686868);
  static const text0 = Colors.black;
  static const text200 = Color(0xFF2E2E2E);
  static const text300 = Color(0xFF4F4F4F);
  static const text400 = Color(0xFF686868);
}

class AppText {
  static List<FontFeature> features = [
    const FontFeature.proportionalFigures(),
    const FontFeature.liningFigures(),
  ];

  static TextStyle extraBold(double size, Color color) =>
      GoogleFonts.syne(
        fontWeight: FontWeight.w800,
        fontSize: size,
        color: color,
        letterSpacing: -0.3,
      ).copyWith(fontFeatures: features);

  static TextStyle bold(double size, Color color) =>
      GoogleFonts.syne(
        fontWeight: FontWeight.w700,
        fontSize: size,
        color: color,
      ).copyWith(fontFeatures: features);

  static TextStyle medium(double size, Color color) =>
      GoogleFonts.syne(
        fontWeight: FontWeight.w500,
        fontSize: size,
        color: color,
      ).copyWith(fontFeatures: features);

  static TextStyle regular(double size, Color color) =>
      GoogleFonts.syne(
        fontWeight: FontWeight.w400,
        fontSize: size,
        color: color,
      ).copyWith(fontFeatures: features);
}

class AppAssets {
  static const bikeOne = 'assets/images/bike_one.png';
  static const bikeTwo = 'assets/images/bike_two.png';
  static const bikeThree = 'assets/images/bike_three.png';

  static const box = 'assets/icons/box.png';
  static const dolar = 'assets/icons/dolar.png';
  static const electric = 'assets/icons/electric.png';
  static const history = 'assets/icons/history.png';
  static const home = 'assets/icons/home.png';
  static const iconsFilter = 'assets/icons/icons_filter.png';
  static const notifications = 'assets/icons/notifications.png';
  static const arrow = 'assets/icons/arrow.png';
  static const arrowBack = 'assets/icons/arrow_back.png';
  static const profile = 'assets/icons/profile.png';
  static const search = 'assets/icons/search.png';
  static const speed = 'assets/icons/speed.png';
  static const share = 'assets/icons/share.png';
}