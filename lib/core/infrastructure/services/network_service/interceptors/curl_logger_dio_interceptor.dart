import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@injectable
class CurlLoggerDioInterceptor extends Interceptor {
  CurlLoggerDioInterceptor({
    this.printOnSuccess = false,
    this.convertFormData = true,
  });
  final bool? printOnSuccess;
  final bool convertFormData;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _renderCurlRepresentation(err.requestOptions);

    return handler.next(err); //continue
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    if (printOnSuccess != null || printOnSuccess!) {
      log(_cURLRepresentation(response.requestOptions));
    }
    return handler.next(response); //continue
  }

  void _renderCurlRepresentation(RequestOptions requestOptions) {
    // add a breakpoint here so all errors can break
    try {
      log(_cURLRepresentation(requestOptions));
    } catch (err) {
      log('unable to create a CURL representation of the requestOptions: ${err.toString()}');
      if (kDebugMode) {
        print('CURL representation error details: $err');
        print('RequestOptions: ${requestOptions.toString()}');
        if (requestOptions.data != null) {
          print('Request data type: ${requestOptions.data.runtimeType}');
        }
      }
    }
  }

  String _cURLRepresentation(RequestOptions options) {
    final components = <String>['curl -i'];
    if (options.method.toUpperCase() != 'GET') {
      components.add('-X ${options.method}');
    }

    options.headers.forEach((k, v) {
      if (k != 'Cookie') {
        components.add('-H "$k: $v"');
      }
    });

    if (options.data != null) {
      if (options.data is FormData) {
        final formData = options.data as FormData;
        for (final field in formData.fields) {
          components.add('-F "${field.key}=${field.value}"');
        }

        for (final file in formData.files) {
          components.add(
            '-F "${file.key}=@${file.value};type=${file.value.contentType}"',
          );
        }
      } else {
        final data = json.encode(options.data).replaceAll('"', '\\"');
        components.add('-d "$data"');
      }
    }

    components.add('"${options.uri}"');

    return components.join(' \\\n\t');
  }
}
