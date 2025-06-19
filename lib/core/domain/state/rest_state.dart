import 'package:example_flutter_app/core/infrastructure/error/api_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rest_state.freezed.dart';

@freezed
class RestState<T> with _$RestState<T> {
  const factory RestState.initial() = _Initial<T>;
  const factory RestState.loading() = _Loading<T>;
  const factory RestState.failure(ServerError error) = _Failure<T>;
  const factory RestState.success(T data) = _Success<T>;
}
