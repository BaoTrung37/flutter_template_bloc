import 'package:dio/dio.dart';
import 'package:example_flutter_app/core/app_config.dart';
import 'package:example_flutter_app/core/infrastructure/services/network/client/rest_api_client.dart';
import 'package:example_flutter_app/core/infrastructure/services/network/common/dio_helper.dart';
import 'package:example_flutter_app/injection/di.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get shared => SharedPreferences.getInstance();

  @Named('apiDio')
  @lazySingleton
  Dio get apiDio {
    final appConfig = getIt<AppConfig>();
    return DioHelper.configApiDio(appConfig);
  }

  @lazySingleton
  RestApiClient get restApiClient {
    final dio = getIt<Dio>(instanceName: 'apiDio');
    final appConfig = getIt<AppConfig>();
    return RestApiClient(dio, baseUrl: appConfig.baseUrl);
  }
}
