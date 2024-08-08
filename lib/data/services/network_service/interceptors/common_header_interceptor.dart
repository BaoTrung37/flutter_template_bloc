// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:example_flutter_app/data/data.dart';
import 'package:injectable/injectable.dart';

@injectable
class CommonHeaderInterceptor extends Interceptor {
  CommonHeaderInterceptor(
    this.sharedManager,
  );
  final SharedManager sharedManager;
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(options);
  }
}
