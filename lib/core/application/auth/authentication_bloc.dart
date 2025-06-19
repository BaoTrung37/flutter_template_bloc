import 'package:bloc/bloc.dart';
import 'package:example_flutter_app/core/infrastructure/core/extensions/api_extension.dart';
import 'package:example_flutter_app/core/infrastructure/error/api_error.dart';
import 'package:example_flutter_app/core/infrastructure/services/network/client/auth_api_client.dart';
import 'package:example_flutter_app/data/dto/auth/sign_in/sign_in_request.dart';
import 'package:example_flutter_app/data/dto/auth/sign_up/sign_up_request.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'authentication_bloc.freezed.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

@lazySingleton
class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(
    this._authApiClient,
  ) : super(const AuthenticationState.initial()) {
    on<_EmailSignIn>(_onEmailSignIn);
    on<_EmailSignUp>(_onEmailSignUp);
    on<_LogOut>(_onLogOut);
    // on<_GoogleLogin>(_onGoogleLogin);
    // on<_FacebookLogin>(_onFacebookLogin);
    // on<_AppleLogin>(_onAppleLogin);
  }

  final AuthApiClient _authApiClient;

  Future<void> _onEmailSignIn(
    _EmailSignIn event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const AuthenticationState.authenticating());
    final response = await _authApiClient
        .emailSignIn(
          SignInRequest(
            email: event.email,
            password: event.password,
          ),
        )
        .handleServerError();

    response.fold(
      (l) => emit(AuthenticationState.unauthenticated(l)),
      (r) => emit(const AuthenticationState.authenticated()),
    );
  }

  Future<void> _onEmailSignUp(
    _EmailSignUp event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(const AuthenticationState.authenticating());

    final response = await _authApiClient
        .emailSignUp(
          SignUpRequest(
            email: event.email,
            password: event.password,
          ),
        )
        .handleServerError();

    response.fold(
      (l) => emit(AuthenticationState.unauthenticated(l)),
      (r) => emit(const AuthenticationState.authenticated()),
    );
  }

  Future<void> _onLogOut(
    _LogOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    //
  }
}
