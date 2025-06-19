part of 'authentication_bloc.dart';

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.started() = _Started;

  const factory AuthenticationEvent.logOut() = _LogOut;

  const factory AuthenticationEvent.googleLogin() = _GoogleLogin;

  const factory AuthenticationEvent.facebookLogin() = _FacebookLogin;

  const factory AuthenticationEvent.appleLogin() = _AppleLogin;

  const factory AuthenticationEvent.emailSignIn({
    required String email,
    required String password,
  }) = _EmailSignIn;

  const factory AuthenticationEvent.emailSignUp({
    required String email,
    required String password,
  }) = _EmailSignUp;
}
