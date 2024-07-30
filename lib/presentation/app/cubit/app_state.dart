part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(Languages.en) Languages currentLanguage,
  }) = _AppState;
}
