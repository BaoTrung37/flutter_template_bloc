import 'package:example_flutter_app/core/theme/colors.dart';
import 'package:example_flutter_app/core/theme/providers/nike_theme.dart';
import 'package:example_flutter_app/core/theme/texts.dart';
import 'package:example_flutter_app/core/theme/theme_data/theme_data_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// We use this to access the theme from the BuildContext in all our widgets
/// We don't use riverpod here so we can get the theme from the context and regular widgets
class ThemeProvider extends InheritedNotifier<AppTheme> {
  const ThemeProvider({
    required super.child,
    super.key,
    super.notifier,
  });

  @override
  bool updateShouldNotify(covariant InheritedNotifier<AppTheme> oldWidget) {
    final isModeChanged = oldWidget.notifier!.mode != notifier!.mode;
    if (isModeChanged) {
      // keep the same theme when switching between light and dark mode while hot reloading
      notifier!.mode = oldWidget.notifier!.mode;
      notifier!.setSystemBarColor();
    }
    return false;
  }

  static AppTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!.notifier!;
}

/// This is the main theme provider
/// There is two main ways to use it
/// uniform: you define a single theme for all platforms
/// adaptive: you define different themes for different platforms
///
/// Defining a theme for light and dark should only change the colors
/// not redefining everything. (see ./docs/theme.md)
class AppTheme with ChangeNotifier {
  AppTheme({
    required this.mode,
    this.lightTheme,
    this.darkTheme,
  }) {
    setSystemBarColor();
  }

  /// Allows you to define a single theme for all platforms
  /// for both light and dark mode or just one of them
  factory AppTheme.uniform({
    required NikeTextTheme textTheme,
    required NikeThemeDataFactory themeFactory,
    required ThemeMode defaultMode,
    NikeColors? lightColors,
    NikeColors? darkColors,
  }) {
    return AppTheme(
      mode: defaultMode,
      lightTheme: lightColors != null
          ? NikeThemeUniform(
              themeFactory.build(
                colors: lightColors,
                defaultTextStyle: textTheme,
              ),
            )
          : null,
      darkTheme: darkColors != null
          ? NikeThemeUniform(
              themeFactory.build(
                colors: darkColors,
                defaultTextStyle: textTheme,
              ),
            )
          : null,
    );
  }

  /// Allows you to define different themes for different platforms
  factory AppTheme.adaptive({
    // maybe you want to use different text themes for different platforms
    required NikeTextTheme defaultTextTheme,
    required ThemeMode mode,
    NikeColors? lightColors,
    NikeColors? darkColors,
    NikeThemeDataFactory? ios,
    NikeThemeDataFactory? android,
    NikeThemeDataFactory? web,
  }) {
    return AppTheme(
      mode: mode,
      lightTheme: lightColors != null
          ? NikeThemeAdaptive(
              ios: ios?.build(
                colors: lightColors,
                defaultTextStyle: defaultTextTheme,
              ),
              android: android?.build(
                colors: lightColors,
                defaultTextStyle: defaultTextTheme,
              ),
              web: web?.build(
                colors: lightColors,
                defaultTextStyle: defaultTextTheme,
              ),
            )
          : null,
      darkTheme: darkColors != null
          ? NikeThemeAdaptive(
              ios: ios?.build(
                colors: darkColors,
                defaultTextStyle: defaultTextTheme,
              ),
              android: android?.build(
                colors: darkColors,
                defaultTextStyle: defaultTextTheme,
              ),
              web: web?.build(
                colors: darkColors,
                defaultTextStyle: defaultTextTheme,
              ),
            )
          : null,
    );
  }
  final NikeTheme? lightTheme;
  final NikeTheme? darkTheme;
  ThemeMode mode;

  /// automatically toggle between light and dark mode
  /// call this using AppTheme.of(context).toggle()
  void toggle() {
    mode = mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
    setSystemBarColor();
  }

  void setSystemBarColor() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness:
            mode == ThemeMode.light ? Brightness.light : Brightness.dark,
        statusBarIconBrightness:
            mode == ThemeMode.light ? Brightness.dark : Brightness.light,
        // statusBarColor: Colors.black, // color for android
        // statusBarBrightness: Brightness.light, // for ios Dark = white status
      ),
    );
  }

  ThemeData get dark {
    if (darkTheme == null) {
      throw Exception('Dark theme is not defined');
    }
    return darkThemeData.copyWith(
      brightness: Brightness.dark,
      extensions: [
        darkTheme!.colors,
        darkTheme!.textTheme,
      ],
    );
  }

  ThemeData get light {
    if (lightTheme == null) {
      throw Exception('Light theme is not defined');
    }
    return lightThemeData.copyWith(
      brightness: Brightness.light,
      extensions: [
        lightTheme!.colors,
        lightTheme!.textTheme,
      ],
    );
  }

  ThemeData get lightThemeData => lightTheme!.data.materialTheme;

  ThemeData get darkThemeData => darkTheme!.data.materialTheme;

  NikeTheme get current {
    if (mode == ThemeMode.light) {
      return lightTheme!;
    } else {
      return darkTheme!;
    }
  }
}
