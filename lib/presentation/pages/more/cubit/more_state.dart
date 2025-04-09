part of 'more_cubit.dart';

@freezed
abstract class MoreState with _$MoreState {
  const factory MoreState({
    @Default(AppStatus.initial) AppStatus status,
  }) = _MoreState;
}
