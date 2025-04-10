part of 'splash_cubit.dart';

@freezed
abstract class SplashState with _$SplashState {
  const factory SplashState({
    @Default(AppStatus.initial) AppStatus appStatus,
    AppError? appError,
  }) = _SplashState;
}
