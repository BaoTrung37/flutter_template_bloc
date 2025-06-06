import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NikeTextTheme extends ThemeExtension<NikeTextTheme> {
  const NikeTextTheme({
    required this.extraBold24,
    required this.extraBold18,
    required this.extraBold16,
    required this.bold30,
    required this.bold26,
    required this.bold20,
    required this.bold18,
    required this.bold16,
    required this.bold14,
    required this.bold12,
    required this.semibold28,
    required this.semibold22,
    required this.semibold20,
    required this.semibold18,
    required this.semibold16,
    required this.semibold14,
    required this.semibold12,
    required this.semibold10,
    required this.medium20,
    required this.medium18,
    required this.medium16,
    required this.medium14,
    required this.medium12,
    required this.regular16,
    required this.regular14,
    required this.regular12,
  });

  factory NikeTextTheme.build() => NikeTextTheme(
        extraBold24: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.w800,
        ),
        extraBold18: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
        extraBold16: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w800,
        ),
        bold30: GoogleFonts.inter(
          fontSize: 30,
          fontWeight: FontWeight.w700,
        ),
        bold26: GoogleFonts.inter(
          fontSize: 26,
          fontWeight: FontWeight.w700,
        ),
        bold20: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w700,
        ),
        bold18: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        bold16: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        bold14: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        bold12: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
        semibold28: GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.w600,
        ),
        semibold22: GoogleFonts.inter(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
        semibold20: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        semibold18: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        semibold16: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        semibold14: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        semibold12: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        semibold10: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
        medium20: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        medium18: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        medium16: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        medium14: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        medium12: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        regular16: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        regular14: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        regular12: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w300,
        ),
      );

  final TextStyle extraBold24;
  final TextStyle extraBold18;
  final TextStyle extraBold16;
  final TextStyle bold30;
  final TextStyle bold26;
  final TextStyle bold20;
  final TextStyle bold18;
  final TextStyle bold16;
  final TextStyle bold14;
  final TextStyle bold12;
  final TextStyle semibold28;
  final TextStyle semibold22;
  final TextStyle semibold20;
  final TextStyle semibold18;
  final TextStyle semibold16;
  final TextStyle semibold14;
  final TextStyle semibold12;
  final TextStyle semibold10;
  final TextStyle medium20;
  final TextStyle medium18;
  final TextStyle medium16;
  final TextStyle medium14;
  final TextStyle medium12;
  final TextStyle regular16;
  final TextStyle regular14;
  final TextStyle regular12;

  @override
  ThemeExtension<NikeTextTheme> copyWith({
    TextStyle? extraBold24,
    TextStyle? extraBold18,
    TextStyle? extraBold16,
    TextStyle? bold30,
    TextStyle? bold26,
    TextStyle? bold20,
    TextStyle? bold18,
    TextStyle? bold16,
    TextStyle? bold14,
    TextStyle? bold12,
    TextStyle? semibold28,
    TextStyle? semibold22,
    TextStyle? semibold20,
    TextStyle? semibold18,
    TextStyle? semibold16,
    TextStyle? semibold14,
    TextStyle? semibold12,
    TextStyle? semibold10,
    TextStyle? medium20,
    TextStyle? medium18,
    TextStyle? medium16,
    TextStyle? medium14,
    TextStyle? medium12,
    TextStyle? regular16,
    TextStyle? regular14,
    TextStyle? regular12,
  }) {
    return NikeTextTheme(
      extraBold24: extraBold24 ?? this.extraBold24,
      extraBold18: extraBold18 ?? this.extraBold18,
      extraBold16: extraBold16 ?? this.extraBold16,
      bold30: bold30 ?? this.bold30,
      bold26: bold26 ?? this.bold26,
      bold20: bold20 ?? this.bold20,
      bold18: bold18 ?? this.bold18,
      bold16: bold16 ?? this.bold16,
      bold14: bold14 ?? this.bold14,
      bold12: bold12 ?? this.bold12,
      semibold28: semibold28 ?? this.semibold28,
      semibold22: semibold22 ?? this.semibold22,
      semibold20: semibold20 ?? this.semibold20,
      semibold18: semibold18 ?? this.semibold18,
      semibold16: semibold16 ?? this.semibold16,
      semibold14: semibold14 ?? this.semibold14,
      semibold12: semibold12 ?? this.semibold12,
      semibold10: semibold10 ?? this.semibold10,
      medium20: medium20 ?? this.medium20,
      medium18: medium18 ?? this.medium18,
      medium16: medium16 ?? this.medium16,
      medium14: medium14 ?? this.medium14,
      medium12: medium12 ?? this.medium12,
      regular16: regular16 ?? this.regular16,
      regular14: regular14 ?? this.regular14,
      regular12: regular12 ?? this.regular12,
    );
  }

  @override
  ThemeExtension<NikeTextTheme> lerp(
    covariant ThemeExtension<NikeTextTheme>? other,
    double t,
  ) {
    if (other is! NikeTextTheme) {
      return this;
    }
    return NikeTextTheme(
      extraBold24: TextStyle.lerp(extraBold24, other.extraBold24, t)!,
      extraBold18: TextStyle.lerp(extraBold18, other.extraBold18, t)!,
      extraBold16: TextStyle.lerp(extraBold16, other.extraBold16, t)!,
      bold30: TextStyle.lerp(bold30, other.bold30, t)!,
      bold26: TextStyle.lerp(bold26, other.bold26, t)!,
      bold20: TextStyle.lerp(bold20, other.bold20, t)!,
      bold18: TextStyle.lerp(bold18, other.bold18, t)!,
      bold16: TextStyle.lerp(bold16, other.bold16, t)!,
      bold14: TextStyle.lerp(bold14, other.bold14, t)!,
      bold12: TextStyle.lerp(bold12, other.bold12, t)!,
      semibold28: TextStyle.lerp(semibold28, other.semibold28, t)!,
      semibold22: TextStyle.lerp(semibold22, other.semibold22, t)!,
      semibold20: TextStyle.lerp(semibold20, other.semibold20, t)!,
      semibold18: TextStyle.lerp(semibold18, other.semibold18, t)!,
      semibold16: TextStyle.lerp(semibold16, other.semibold16, t)!,
      semibold14: TextStyle.lerp(semibold14, other.semibold14, t)!,
      semibold12: TextStyle.lerp(semibold12, other.semibold12, t)!,
      semibold10: TextStyle.lerp(semibold10, other.semibold10, t)!,
      medium20: TextStyle.lerp(medium20, other.medium20, t)!,
      medium18: TextStyle.lerp(medium18, other.medium18, t)!,
      medium16: TextStyle.lerp(medium16, other.medium16, t)!,
      medium14: TextStyle.lerp(medium14, other.medium14, t)!,
      medium12: TextStyle.lerp(medium12, other.medium12, t)!,
      regular16: TextStyle.lerp(regular16, other.regular16, t)!,
      regular14: TextStyle.lerp(regular14, other.regular14, t)!,
      regular12: TextStyle.lerp(regular12, other.regular12, t)!,
    );
  }
}
