import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_request.g.dart';

@JsonSerializable()
class UserRequest {
  UserRequest({
    required this.email,
    required this.password,
  });
  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);

  final String email;
  final String password;
}
