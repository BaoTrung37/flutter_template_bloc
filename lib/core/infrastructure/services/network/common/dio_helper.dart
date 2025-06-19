import 'package:dio/dio.dart';
import 'package:example_flutter_app/core/app_config.dart';
import 'package:example_flutter_app/core/infrastructure/core/interceptors/auth_interceptor.dart';
import 'package:example_flutter_app/core/infrastructure/core/interceptors/curl_logger_dio_interceptor.dart';
import 'package:example_flutter_app/injection/di.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class DioHelper {
  // @factoryMethod
  static Dio configApiDio(AppConfig appConfig) => _createDio(
        options: BaseOptions(
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          baseUrl: appConfig.envKeys.baseUrl,
        ),
        interceptors: [
          getIt<AuthInterceptor>(),
        ],
        loggerEnable: true,
      );

  static Dio _createDio({
    required BaseOptions options,
    List<Interceptor>? interceptors,
    bool loggerEnable = true,
  }) {
    final dio = Dio();
    dio.options = options;

    if (interceptors != null) {
      dio.interceptors.addAll(
        [...interceptors],
      );
    }

    if (loggerEnable) {
      dio.interceptors.add(_DebugLogger());
      dio.interceptors.add(CurlLoggerDioInterceptor());
    }
    return dio;
  }
}

class _DebugLogger extends PrettyDioLogger {
  _DebugLogger()
      : super(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 1000,
        );
}
