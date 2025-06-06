// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class AppColors {
  final Color primaryColor;
  final Color secondaryColor;

  final Color textPrimary;
  final Color textSecondary;

  final Color border;

  AppColors({
    required this.primaryColor,
    required this.secondaryColor,
    required this.textPrimary,
    required this.textSecondary,
    required this.border,
  });
}

final colorsLight = AppColors(
  primaryColor: const Color(0xFF6200EE),
  secondaryColor: Colors.white,
  textPrimary: Colors.black,
  textSecondary: Colors.black.withValues(alpha: 0.6),
  border: Colors.grey.withValues(alpha: 0.6),
);

final colorsDark = AppColors(
  primaryColor: const Color(0xFFBB86FC),
  secondaryColor: Colors.black,
  textPrimary: Colors.white,
  textSecondary: Colors.white.withValues(alpha: 0.6),
  border: Colors.grey.withValues(alpha: 0.6),
);

extension AppColorsExtension on BuildContext {
  AppColors get colors {
    final brightness = Theme.of(this).brightness;
    switch (brightness) {
      case Brightness.light:
        return colorsLight;
      case Brightness.dark:
        return colorsDark;
    }
  }
}
