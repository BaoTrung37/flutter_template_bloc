import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers['Authorization'] = 'Bearer ${EnvKeys.token}';
    // options.queryParameters['api_key'] = EnvKeys.apiKey;
    handler.next(options);
  }
}
