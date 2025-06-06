// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:example_flutter_app/data/data.dart';
import 'package:injectable/injectable.dart';

@injectable
class TokenRefreshInterceptor extends InterceptorsWrapper {
  TokenRefreshInterceptor({
    required this.sharedManager,
  });

  final SharedManager sharedManager;
  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (!err.isTokenExpired) {
      return handler.next(err);
    }
  }
}
