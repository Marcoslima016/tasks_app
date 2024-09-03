import 'package:flutter/material.dart';
import 'package:tasks_app/lib.exports.dart';

class AText extends StatelessWidget {
  final ThemeTextStyle? style;
  final String data;
  final Color? color;
  final TextAlign? align;
  final TextStyle? variation;

  AText.displaySmall(
    this.data, {
    super.key,
    this.color,
    this.variation,
    this.align,
  }) : style = ThemeTextStylesTokens.displaySmall;

  AText.displayRegular(
    this.data, {
    super.key,
    this.color,
    this.variation,
    this.align,
  }) : style = ThemeTextStylesTokens.displayRegular;

  AText.displayLarge(
    this.data, {
    super.key,
    this.color,
    this.variation,
    this.align,
  }) : style = ThemeTextStylesTokens.displayLarge;

  AText.displayExtraLarge(
    this.data, {
    super.key,
    this.color,
    this.variation,
    this.align,
  }) : style = ThemeTextStylesTokens.displayExtraLarge;

  AText.headingSmall(
    this.data, {
    super.key,
    this.color,
    this.variation,
    this.align,
  }) : style = ThemeTextStylesTokens.headingSmall;

  AText.headingRegular(
    this.data, {
    super.key,
    this.color,
    this.variation,
    this.align,
  }) : style = ThemeTextStylesTokens.headingRegular;

  AText.headingLarge(
    this.data, {
    super.key,
    this.color,
    this.variation,
    this.align,
  }) : style = ThemeTextStylesTokens.headingLarge;

  AText.bodyRegular(
    this.data, {
    super.key,
    this.color,
    this.variation,
    this.align,
  }) : style = ThemeTextStylesTokens.bodyRegular;

  AText.bodyLarge(
    this.data, {
    super.key,
    this.color,
    this.variation,
    this.align,
  }) : style = ThemeTextStylesTokens.bodyLarge;

  AText.bodySmall(
    this.data, {
    super.key,
    this.color,
    this.variation,
    this.align,
  }) : style = ThemeTextStylesTokens.bodySmall;

  AText.bodyRegularBold(
    this.data, {
    super.key,
    this.color,
    this.variation,
    this.align,
  }) : style = ThemeTextStylesTokens.bodyRegularBold;

  AText.labelSmall(
    this.data, {
    super.key,
    this.color,
    this.variation,
    this.align,
  }) : style = ThemeTextStylesTokens.labelSmall;

  AText.labelExtraSmall(
    this.data, {
    super.key,
    this.color,
    this.variation,
    this.align,
  }) : style = ThemeTextStylesTokens.labelExtraSmall;

  @override
  Widget build(BuildContext context) {
    TextStyle finalStyle = style!;

    finalStyle = style!.copyWith(
      color: color,
      height: variation?.height,
    );

    return Text(
      data,
      style: finalStyle,
      textAlign: align,
    );
  }
}
