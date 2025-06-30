part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const AuthenticationState._();
  const factory AuthenticationState.initial() = _Initial;

  const factory AuthenticationState.authenticating() = _Authenticating;

  const factory AuthenticationState.unauthenticated(ServerError error) =
      _Unauthenticated;

  const factory AuthenticationState.authenticated() = _Authenticated;

  bool get isAuthenticated => this is _Authenticated;
}
