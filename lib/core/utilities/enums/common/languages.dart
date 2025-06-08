import 'dart:ui';

enum Languages {
  en,
  ko,
  vi,
}

extension LanguagesExtension on Languages {
  String get name {
    switch (this) {
      case Languages.en:
        return 'English';
      case Languages.ko:
        return '한국어';
      case Languages.vi:
        return 'Tiếng Việt';
    }
  }

  Locale get locate {
    switch (this) {
      case Languages.en:
        return const Locale('en');
      case Languages.ko:
        return const Locale('ko');
      case Languages.vi:
        return const Locale('vi');
    }
  }

  String get languageCode {
    switch (this) {
      case Languages.en:
        return 'en';
      case Languages.ko:
        return 'ko';
      case Languages.vi:
        return 'vi';
    }
  }
}
