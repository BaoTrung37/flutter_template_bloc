import 'package:example_flutter_app/core/theme/colors.dart';
import 'package:example_flutter_app/core/theme/texts.dart';
import 'package:example_flutter_app/core/theme/theme_data/theme_data.dart';
import 'package:example_flutter_app/core/theme/theme_data/theme_data_factory.dart';
import 'package:flutter/material.dart';

/// This is a uniform theme
/// But you can use it to create multiple themes for iOS, Android, Web, Desktop...
class UniversalThemeFactory extends NikeThemeDataFactory {
  const UniversalThemeFactory();

  @override
  NikeThemeData build({
    required NikeColors colors,
    required NikeTextTheme defaultTextStyle,
  }) {
    return NikeThemeData(
      colors: colors,
      defaultTextTheme: defaultTextStyle,
      materialTheme: ThemeData(
        fontFamily: 'Inter', // *change to your font family
        colorScheme: ColorScheme.fromSeed(seedColor: colors.primary).copyWith(
          surface: colors.white,
          onSurface: colors.black,
          primary: colors.primary,
          onPrimary: colors.white,
          error: colors.red,
        ),
        scaffoldBackgroundColor: colors.white,
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        elevatedButtonTheme: elevatedButtonTheme(
          colors: colors,
          textTheme: defaultTextStyle,
        ),
        outlinedButtonTheme: outlinedButtonTheme(
          colors: colors,
          textTheme: defaultTextStyle,
        ),
        inputDecorationTheme: inputDecorationTheme(
          colors: colors,
          textTheme: defaultTextStyle,
        ),
        textTheme: textTheme(
          colors: colors,
          defaultTextStyle: defaultTextStyle,
        ),
        navigationRailTheme: navigationRailThemeData(
          colors: colors,
          textTheme: defaultTextStyle,
        ),
        appBarTheme: AppBarTheme(
          scrolledUnderElevation: 0,
          backgroundColor: colors.white,
          foregroundColor: colors.black,
          centerTitle: false,
          titleTextStyle: defaultTextStyle.bold18.copyWith(
            color: colors.black,
          ),
          iconTheme: const IconThemeData(
            size: 24,
          ),
          elevation: 0,
        ),
      ),
    );
  }

  NavigationRailThemeData navigationRailThemeData({
    required NikeColors colors,
    required NikeTextTheme textTheme,
  }) =>
      NavigationRailThemeData(
        backgroundColor: colors.white,
        elevation: 0,
        selectedIconTheme: IconThemeData(
          color: colors.primary,
        ),
        unselectedIconTheme: IconThemeData(
          color: colors.grey2,
        ),
        selectedLabelTextStyle: textTheme.bold16.copyWith(
          color: colors.primary,
        ),
        unselectedLabelTextStyle: textTheme.semibold16.copyWith(
          color: colors.grey,
        ),
      );

  ElevatedButtonThemeData elevatedButtonTheme({
    required NikeColors colors,
    required NikeTextTheme textTheme,
  }) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(200, 48),
          foregroundColor: colors.white,
          backgroundColor: colors.primary,
          disabledBackgroundColor: colors.grey3,
          disabledForegroundColor: colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: textTheme.bold16.copyWith(
            color: colors.white,
          ),
          elevation: 0,
        ),
      );

  OutlinedButtonThemeData outlinedButtonTheme({
    required NikeColors colors,
    required NikeTextTheme textTheme,
  }) =>
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(200, 48),
          foregroundColor: colors.primary,
          backgroundColor: colors.white,
          disabledBackgroundColor: colors.grey3,
          disabledForegroundColor: colors.white,
          side: BorderSide(color: colors.primary, width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: textTheme.bold16.copyWith(
            color: colors.primary,
          ),
          elevation: 0,
        ),
      );

  InputDecorationTheme inputDecorationTheme({
    required NikeColors colors,
    required NikeTextTheme textTheme,
  }) =>
      InputDecorationTheme(
        fillColor: colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 18,
          horizontal: 16,
        ),
        isDense: true,
        
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colors.grey3),
          borderRadius: BorderRadius.circular(14),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.grey3),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.primary),
          borderRadius: BorderRadius.circular(14),
        ),
        filled: true,
        hintStyle: textTheme.regular16.copyWith(
          color: colors.grey3,
        ),
        labelStyle: textTheme.regular16.copyWith(
          color: colors.grey3,
        ),
      );

  PageTransitionsTheme get pageTransitionsTheme => const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      );

  TextTheme textTheme({
    required NikeColors colors,
    required NikeTextTheme defaultTextStyle,
  }) =>
      TextTheme(
        headlineLarge: defaultTextStyle.bold30.copyWith(
          fontSize: 32,
          color: colors.black,
          fontWeight: FontWeight.w700,
        ),
      );
}
