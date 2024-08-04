import 'package:dio/dio.dart';

extension ApiErrorExtension on DioException {
  ///
  // String get content => _getContent();

  ///
  int? get statusCode => response?.statusCode;

  ///
  bool get isDataError => statusCode.toString()[0] == '4';

  ///
  bool get isServerError => statusCode.toString()[0] == '5';

  ///
  bool get isBadRequest => statusCode == 400;

  ///
  bool get isTokenExpired {
    try {
      if (statusCode == 401 &&
          response?.data['status_code'] == 33 &&
          response?.data['status_message'] ==
              'Invalid request token: The request token is either expired or invalid.') {
        return true;
      }
    } catch (_) {
      // Do nothing
    }
    return false;
  }
}
