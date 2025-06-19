import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_message.freezed.dart';
part 'base_message.g.dart';

@freezed
abstract class BaseMessage with _$BaseMessage {
  const factory BaseMessage({
    required String message,
  }) = _BaseMessage;

  factory BaseMessage.fromJson(Map<String, dynamic> json) =>
      _$BaseMessageFromJson(json);
}
