part of 'app_cubit.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    @Default(AppStatus.initial) AppStatus status,
    @Default(Languages.en) Languages currentLanguage,
  }) = _AppState;
}
