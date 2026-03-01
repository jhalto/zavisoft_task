import 'package:flutter/material.dart';
import 'package:zavisoft_task/core/const/app_colors.dart';

 TextStyle get defaultTextStyle => const TextStyle(
  fontFamily: "Inter",
  fontWeight: FontWeight.w400,
  fontSize: 14,
  height: 1.2,
);

class AppTextStyle {


  static const String _fontFamily = 'Inter';

  // ---------- Headlines ----------
  static TextStyle get headline1 => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 32,
    height: 1.3,
  );

  static TextStyle get headline2 => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 28,
    height: 1.3,
  );

  static TextStyle get headline3 => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    height: 1.3,
  );

  // ---------- Titles ----------
  static TextStyle get titleExtraLarge => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 22,
    height: 1.3,
  );

  static TextStyle get titleLarge => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 20,
    height: 1.3,
  );

  static TextStyle get titleMedium => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 18,
    height: 1.3,
  );

  static TextStyle get titleSmall => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 1.3,
  );

  // ---------- Body ----------
  static TextStyle get bodyLarge => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 1.2,
    color: Colors.black87,
  );

  static TextStyle get bodyMedium => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.2,
    color: Colors.black87,
  );
  static TextStyle get bodyMediumWhite => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.2,
    color: Colors.white,
  );

  static TextStyle get bodyMediumSecondary => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 1.2,
    color: Color(0xff5E5E5E),
  );

  static TextStyle get bodySmall => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 1.2,
    color: Colors.black54,
  );

  static TextStyle get bodySlideBold => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.2,
  );
  static TextStyle get bodyBold => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: Colors.white,
    height: 1.2,
  );

  // ---------- Buttons & Labels ----------
  static TextStyle get buttonText => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    height: 1.2,
    color: Colors.white,
  );

  static TextStyle get labelLarge => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    height: 1.2,
  );

  static TextStyle get labelMedium => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    height: 1.2,
    color: AppColors.secondaryTextColor,
  );

  static TextStyle get labelSmall => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 10,
    height: 1.2,
  );

  // ---------- Caption ----------
  static TextStyle get caption => const TextStyle(
    fontFamily: _fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: 12,
    height: 1.3,
    color: Color(0xFF757575),
  );
}