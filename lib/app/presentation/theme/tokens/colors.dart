import 'package:flutter/material.dart';

abstract class IThemeColorsTokens {
  Color get primary;
  Color get onPrimary;
  Color get secondary;
  Color get onSecondary;
  Color get disable;
  Color get onDisable;
  Color get surface;
  Color get onSurface;
  Color get background;
  Color get onBackground;
}

class ColorsLight implements IThemeColorsTokens {
  ColorsLight();

  @override
  final Color primary = const Color.fromARGB(255, 27, 60, 170);

  @override
  final Color onPrimary = const Color.fromARGB(255, 239, 239, 239);

  @override
  final Color secondary = Colors.grey[850]!;

  @override
  Color get onSecondary => Colors.white;

  @override
  final Color surface = const Color.fromARGB(255, 255, 255, 255);

  @override
  Color get onSurface => const Color.fromARGB(255, 57, 57, 57);

  @override
  final Color background = const Color.fromARGB(255, 253, 253, 253);

  @override
  final Color onBackground = const Color.fromARGB(255, 250, 250, 250);

  @override
  Color get disable => const Color.fromARGB(255, 229, 228, 228);

  @override
  Color get onDisable => const Color.fromARGB(255, 166, 165, 165);
}
