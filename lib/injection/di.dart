import 'package:dio/dio.dart';
import 'package:example_flutter_app/config/app_config.dart';
import 'package:example_flutter_app/config/router/app_router.dart';
import 'package:example_flutter_app/config/services/network_service/common/dio_helper.dart';
import 'package:example_flutter_app/injection/di.config.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@InjectableInit(
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies(AppConfig appConfig) async {
  await getIt.init();
  getIt.registerLazySingleton<AppConfig>(() => appConfig);
  getIt.registerLazySingleton<Dio>(
    () => DioHelper.configApiDio(appConfig),
  );
  getIt.registerSingleton(AppRouter(navigatorKey: navigatorKey));
}
