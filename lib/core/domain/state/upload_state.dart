import 'package:example_flutter_app/core/infrastructure/error/api_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_state.freezed.dart';

@freezed
class UploadState<T> with _$UploadState<T> {
  const factory UploadState.initial() = _Initial;
  const factory UploadState.uploading() = _Uploading;
  const factory UploadState.uploadingProgress(double progress) =
      _UploadingProgress;
  const factory UploadState.uploaded(T data) = _Uploaded;
  const factory UploadState.failed(ServerError error) = _Failed;
}
