import 'package:dio/dio.dart';
import 'package:example_flutter_app/core/app_config.dart';
import 'package:example_flutter_app/core/services/network_service/client/rest_client.dart';
import 'package:example_flutter_app/injection/di.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get shared => SharedPreferences.getInstance();

  @injectable
  RestClient get restClient {
    final dio = getIt<Dio>();
    final appConfig = getIt<AppConfig>();
    return RestClient(dio, baseUrl: appConfig.baseUrl);
  }
}
