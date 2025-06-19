import 'package:dio/dio.dart';
import 'package:example_flutter_app/data/data.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._sharedManager);

  final SharedManager _sharedManager;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    const token = '';
    options.headers['Authorization'] = 'Bearer $token';
    options.headers['x-api-key'] =
        'reqres-free-v1'; // TODO: Remove if not needed
    handler.next(options);
  }
}
