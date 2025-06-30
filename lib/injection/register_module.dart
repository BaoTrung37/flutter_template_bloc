import 'package:example_flutter_app/core/config.dart';
import 'package:example_flutter_app/core/infrastructure/services/network/client/auth_api_client.dart';
import 'package:example_flutter_app/injection/injection.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get shared => SharedPreferences.getInstance();

  @lazySingleton
  RestApiClient get restApiClient {
    final dio = DioHelper.configApiDio(getIt<AppConfig>());
    return RestApiClient(dio, baseUrl: getIt<AppConfig>().envKeys.baseUrl);
  }

  @lazySingleton
  AuthApiClient get authApiClient {
    final dio = DioHelper.configApiDio(getIt<AppConfig>());
    return AuthApiClient(dio, baseUrl: getIt<AppConfig>().envKeys.reqResUrl);
  }
}
