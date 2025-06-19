import 'package:example_flutter_app/core/theme/colors.dart';
import 'package:example_flutter_app/core/theme/providers/theme_provider.dart';
import 'package:example_flutter_app/core/theme/texts.dart';
import 'package:example_flutter_app/core/theme/theme_data/theme_data.dart';
import 'package:example_flutter_app/gen/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  // Access the NikeColors extension from the current theme
  NikeColors get colors => Theme.of(this).extension<NikeColors>()!;

  // Retrieve the localized strings for the current context
  AppLocalizations? get locate => AppLocalizations.of(this);

  // Access the text theme from the current theme
  NikeTextTheme get textTheme => Theme.of(this).extension<NikeTextTheme>()!;

  // Access the full theme data for the current context
  ThemeData get theme => Theme.of(this);

  // Get the current brightness setting (light or dark mode)
  Brightness get brightness => Theme.of(this).brightness;

  // Access the current WiseHomieThemeData from the ThemeProvider
  NikeThemeData get kitTheme => ThemeProvider.of(this).current.data;
}
