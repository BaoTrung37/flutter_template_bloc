import 'package:bloc/bloc.dart';
import 'package:example_flutter_app/core/infrastructure/error/api_error.dart';
import 'package:example_flutter_app/core/infrastructure/services/network/client/auth_api_client.dart';
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
    on<_LogOut>(_onLogOut);
  }

  final AuthApiClient _authApiClient;

  Future<void> _onLogOut(
    _LogOut event,
    Emitter<AuthenticationState> emit,
  ) async {
    //
  }
}
