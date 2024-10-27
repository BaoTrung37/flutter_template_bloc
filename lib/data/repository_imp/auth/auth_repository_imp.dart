import 'package:example_flutter_app/data/data.dart';
import 'package:example_flutter_app/data/dto/auth/login_request.dart';
import 'package:example_flutter_app/domain/repository/auth/auth_repository.dart';
import 'package:example_flutter_app/presentation/utilities/logger/app_logger.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthRepositoryImp implements AuthRepository {
  AuthRepositoryImp(this._restClient, this._sharedManager);

  final RestClient _restClient;
  final SharedManager _sharedManager;

  @override
  Future<void> login(String email, String password) async {
    try {
      final response = await _restClient.login(
        LoginRequest(email: email, password: password),
      );
      await _sharedManager.saveAccessToken(response.accessToken);
    } catch (e) {
      AppLogger.instance.logE(e.toString());
      throw Exception('Login failed');
    }
  }

  @override
  Future<bool> isLogged() async {
    return _sharedManager.getAccessToken() != null;
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}
