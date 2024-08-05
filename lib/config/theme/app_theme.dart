import 'package:flutter/material.dart';

ThemeData getThemeData(Brightness brightness) {
  // final colors = brightness == Brightness.light ? colorsLight : colorsDark;
  return ThemeData(
    brightness: brightness,
  );
}
