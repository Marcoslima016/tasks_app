import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeTextStylesTokens {
  const ThemeTextStylesTokens();

  static const TextStyle _parent = TextStyle(
    fontFamily: "Figtree",
  );

  //----------------------------------------- DISPLAY -----------------------------------------

  static ThemeTextStyle displayExtraLarge = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 30,
      fontWeight: FontWeight.w900,
      color: Colors.grey[50],
    ),
  );

  static ThemeTextStyle displayLarge = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 28,
      fontWeight: FontWeight.w900,
      color: Colors.grey[50],
    ),
  );

  static ThemeTextStyle displayRegular = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w800,
      color: Colors.grey[50],
    ),
  );

  static ThemeTextStyle displaySmall = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 20,
      fontWeight: FontWeight.w900,
      color: Colors.grey[50],
    ),
  );

  //------------------------------------------ HEADING ------------------------------------------

  static ThemeTextStyle headingLarge = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: Colors.grey[200],
    ),
  );

  static ThemeTextStyle headingRegular = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w800,
      color: const Color.fromARGB(255, 21, 21, 21),
    ),
  );

  static ThemeTextStyle headingSmall = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: Colors.grey[200],
    ),
  );

  //-------------------------------------------- BODY --------------------------------------------

  static ThemeTextStyle bodyLarge = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w300,
      // height: 1.18,
      color: Colors.grey[400],
    ),
  );

  static ThemeTextStyle bodyRegular = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      // height: 1.18,
      color: const Color.fromARGB(255, 21, 21, 21),
    ),
  );

  static ThemeTextStyle bodySmall = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      // height: 1.18,
      color: Colors.grey[600],
    ),
  );

  static ThemeTextStyle bodyRegularBold = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w800,
      height: 1.18,
      color: Colors.grey[200],
    ),
  );

  //-------------------------------------------- LABEL --------------------------------------------

  static ThemeTextStyle labelSmall = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w300,
      height: 1.18,
      color: const Color.fromARGB(255, 206, 206, 206),
    ),
  );

  static ThemeTextStyle labelExtraSmall = ThemeTextStyle.style(
    _parent.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w300,
      height: 1.18,
      color: Colors.grey[500],
    ),
  );
}

class ThemeTextStyle extends TextStyle {
  // const ThemeTextStyle._();

  ThemeTextStyle.style(TextStyle style)
      : super(
          inherit: style.inherit,
          color: style.color,
          backgroundColor: style.backgroundColor,
          fontSize: style.fontSize,
          fontWeight: style.fontWeight,
          fontStyle: style.fontStyle,
          letterSpacing: style.letterSpacing,
          wordSpacing: style.wordSpacing,
          textBaseline: style.textBaseline,
          height: style.height,
          leadingDistribution: style.leadingDistribution,
          locale: style.locale,
          foreground: style.foreground,
          background: style.background,
          shadows: style.shadows,
          fontFeatures: style.fontFeatures,
          decoration: style.decoration,
          decorationColor: style.decorationColor,
          decorationStyle: style.decorationStyle,
          decorationThickness: style.decorationThickness,
          debugLabel: style.debugLabel,
          fontFamily: style.fontFamily,
          fontFamilyFallback: style.fontFamilyFallback,
          // package: style.package,
          overflow: style.overflow,
        );

  @override
  double get fontSize {
    double sizeAdjustedToScreen = super.fontSize!.sp;
    return sizeAdjustedToScreen;
  }
}
