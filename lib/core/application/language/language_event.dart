part of 'language_bloc.dart';

@freezed
class LanguageEvent with _$LanguageEvent {
  const factory LanguageEvent.changeLanguage() = _ChangeLanguage;
  const factory LanguageEvent.changeTempLanguage(Languages language) =
      _ChangeTempLanguage;
}
