import 'package:flutter/material.dart';

class Pallets {
  static const Color primary = Color(0xff007E63);
  static const Color secondary = Color(0xffd9ece8);
  static const Color tertiary = Color(0xffD9D9D9);
  static const Color primaryText = Color(0xff000000);
  static const Color secondaryText = Color(0xffFFFFFF);
  static const Color highlightColor = Color(0xffADADAD);

  static MaterialColor customGray = const MaterialColor(
    0xFF505050,
    <int, Color>{
      50: Color(0xFFE0E0E0),
      100: Color(0xFFB3B3B3),
      200: Color(0xFF808080),
      300: Color(0xFF666666),
      400: Color(0xFF575757),
      500: Color(0xFF505050),
      600: Color(0xFF484848),
      700: Color(0xFF3F3F3F),
      800: Color(0xFF363636),
      900: Color(0xFF292929),
    },
  );
}
