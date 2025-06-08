part of 'language_bloc.dart';

@freezed
abstract class LanguageState with _$LanguageState {
  factory LanguageState({
    required Languages language,
    required Languages tempLanguage,
  }) = _LanguageState;

  factory LanguageState.initial() => LanguageState(
        language: Languages.en,
        tempLanguage: Languages.en,
      );

  factory LanguageState.fromJson(Map<String, dynamic> json) =>
      _$LanguageStateFromJson(json);
}
