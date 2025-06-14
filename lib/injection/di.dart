import 'package:dio/dio.dart';
import 'package:example_flutter_app/core/app_config.dart';
import 'package:example_flutter_app/core/infrastructure/services/network_service/common/dio_helper.dart';
import 'package:example_flutter_app/injection/di.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies(AppConfig appConfig) async {
  await getIt.init();
  getIt.registerLazySingleton<Dio>(
    () => DioHelper.configApiDio(appConfig),
  );
}
