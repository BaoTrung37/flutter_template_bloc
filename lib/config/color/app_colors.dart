import 'package:flutter/material.dart';

class AppColors {
  final Color primaryColor;

  AppColors({
    required this.primaryColor,
  });
}

final colorsLight = AppColors(
  primaryColor: const Color(0xFF6200EE),
);

final colorsDark = AppColors(
  primaryColor: const Color(0xFFBB86FC),
);

extension AppColorsExtension on BuildContext {
  AppColors get colors {
    final brightness = Theme.of(this).brightness;
    switch (brightness) {
      case Brightness.light:
        return colorsLight;
      case Brightness.dark:
        return colorsDark;
      default:
        return colorsLight;
    }
  }
}
