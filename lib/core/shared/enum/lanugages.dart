import 'package:flutter/material.dart';

enum Languages {
  en,
  vi,
  // auto,
}

extension LanguagesExtension on Languages {
  String get name => switch (this) {
        Languages.en => 'English',
        Languages.vi => 'Vietnamese',
        // Languages.auto => 'Automatic',
      };
  String get code => switch (this) {
        Languages.en => 'en',
        Languages.vi => 'vi',
        // Languages.auto => 'auto',
      };

  String get title => switch (this) {
        Languages.en => 'English - English',
        Languages.vi => 'Vietnamese - Tiếng Việt',
        // Languages.auto => 'Automatic - Detect Input',
      };
  Locale get locale => Locale(code);
}
