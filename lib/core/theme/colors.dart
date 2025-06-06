import 'package:flutter/material.dart';

class NikeColors extends ThemeExtension<NikeColors> {
  NikeColors({
    required this.primary,
    required this.grey1,
    required this.grey2,
    required this.grey3,
    required this.black,
    required this.white,
    required this.grey,
    required this.grey5,
    required this.green,
    required this.greenSupport,
    required this.greenSupport2,
    required this.red,
    required this.redSupport,
    required this.redSupport2,
    required this.blue,
  });

  factory NikeColors.dark() => NikeColors(
        primary: const Color(0xFF006FFD),
        grey1: const Color(0xFFB0B0B0),
        grey2: const Color(0xFF2E2E2E),
        grey3: const Color(0xFF4A4A4A),
        black: const Color(0xFFE0E0E0),
        white: const Color(0xFF1A1A1A),
        grey: const Color(0xFF9E9E9E),
        grey5: const Color(0xFF3A3A3A),
        green: const Color(0xFF00E676),
        greenSupport: const Color(0xFF1B5E20),
        greenSupport2: const Color(0xFFD5F6D6),
        redSupport: const Color(0xFFB71C1C),
        redSupport2: const Color(0xFFFFDCDC),
        red: const Color(0xFFFF8A80),
        blue: const Color(0xFF0D47A1),
      );

  factory NikeColors.light() => NikeColors(
        primary: const Color(0xFF006FFD),
        grey1: const Color(0xFF71727A),
        grey2: const Color(0xFFF5F5F5),
        grey3: const Color(0xFFC5C6CC),
        black: const Color(0xFF13132D),
        white: const Color(0xFFFFFFFF),
        grey: const Color(0xFF5F5B5B),
        grey5: const Color(0xFFEBEBEB),
        green: const Color(0xff2CD232),
        greenSupport: const Color(0xff2CD232),
        greenSupport2: const Color(0xFFD5F6D6),
        redSupport: const Color(0xffFF616D),
        redSupport2: const Color(0xFFFFDCDC),
        red: const Color(0xffFF616D),
        blue: const Color(0xffEFF3FF),
      );

  final Color primary;
  final Color blue;
  final Color black;
  final Color grey;
  final Color grey1;
  final Color grey2;
  final Color grey3;
  final Color grey5;
  final Color white;
  final Color green;
  final Color greenSupport;
  final Color greenSupport2;
  final Color red;
  final Color redSupport;
  final Color redSupport2;

  @override
  ThemeExtension<NikeColors> copyWith({
    Color? primary,
    Color? black,
    Color? white,
    Color? grey,
    Color? grey1,
    Color? grey2,
    Color? grey3,
    Color? grey5,
    Color? green,
    Color? greenSupport,
    Color? greenSupport2,
    Color? redSupport,
    Color? red,
    Color? blue,
    Color? redSupport2,
  }) {
    return NikeColors(
      primary: primary ?? this.primary,
      black: black ?? this.black,
      white: white ?? this.white,
      grey: grey ?? this.grey,
      grey1: grey1 ?? this.grey1,
      grey2: grey2 ?? this.grey2,
      grey3: grey3 ?? this.grey3,
      grey5: grey5 ?? this.grey5,
      green: green ?? this.green,
      greenSupport: greenSupport ?? this.greenSupport,
      greenSupport2: greenSupport2 ?? this.greenSupport2,
      redSupport: redSupport ?? this.redSupport,
      blue: blue ?? this.blue,
      red: red ?? this.red,
      redSupport2: redSupport2 ?? this.redSupport2,
    );
  }

  @override
  ThemeExtension<NikeColors> lerp(
    covariant ThemeExtension<NikeColors>? other,
    double t,
  ) {
    if (other == null || other is! NikeColors) {
      return this;
    }

    return NikeColors(
      primary: Color.lerp(primary, other.primary, t)!,
      black: Color.lerp(black, other.black, t)!,
      white: Color.lerp(white, other.white, t)!,
      grey: Color.lerp(grey, other.grey, t)!,
      grey1: Color.lerp(grey1, other.grey1, t)!,
      grey2: Color.lerp(grey2, other.grey2, t)!,
      grey3: Color.lerp(grey3, other.grey3, t)!,
      grey5: Color.lerp(grey5, other.grey5, t)!,
      green: Color.lerp(green, other.green, t)!,
      greenSupport: Color.lerp(greenSupport, other.greenSupport, t)!,
      greenSupport2: Color.lerp(greenSupport2, other.greenSupport2, t)!,
      redSupport: Color.lerp(redSupport, other.redSupport, t)!,
      redSupport2: Color.lerp(redSupport2, other.redSupport2, t)!,
      red: Color.lerp(red, other.red, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
    );
  }
}
