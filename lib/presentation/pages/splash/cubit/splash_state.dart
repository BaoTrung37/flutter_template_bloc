part of 'splash_cubit.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState({
    @Default(AppStatus.initial) AppStatus appStatus,
    AppError? appError,
  }) = _SplashState;
}
