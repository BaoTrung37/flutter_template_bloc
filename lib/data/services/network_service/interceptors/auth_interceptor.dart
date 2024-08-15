import 'package:dio/dio.dart';
import 'package:example_flutter_app/data/data.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._sharedManager);

  final SharedManager _sharedManager;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _sharedManager.getAccessToken();
    options.headers['Authorization'] = 'Bearer $token';
    handler.next(options);
  }
}
