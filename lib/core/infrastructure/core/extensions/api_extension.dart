import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:example_flutter_app/core/infrastructure/error/api_error.dart';

extension EitherCast<T> on Future<T> {
  Future<Either<ServerError, T>> handleServerError() async {
    return Task(() => this)
        .attempt()
        .map(
          (either) => either.leftMap((obj) {
            if (obj is DioException) {
              switch (obj.type) {
                case DioExceptionType.connectionTimeout:
                case DioExceptionType.sendTimeout:
                case DioExceptionType.receiveTimeout:
                  return const ServerError(
                      errorCode: ErrorCode.timeout,
                      developerText: 'Timeout error');
                case DioExceptionType.connectionError:
                  return const ServerError(
                      errorCode: ErrorCode.network,
                      developerText: 'Network error');
                case DioExceptionType.badCertificate:
                  return const ServerError(
                      errorCode: ErrorCode.format,
                      developerText: 'Bad certificate');
                case DioExceptionType.cancel:
                  return const ServerError(
                      errorCode: ErrorCode.cancelled,
                      developerText: 'Cancel error');
                case DioExceptionType.unknown:
                  return const ServerError(
                      errorCode: ErrorCode.unknown,
                      developerText: 'Network error');
                case DioExceptionType.badResponse:
                  final data = obj.response!.data;
                  return mapServerError(data as Map<String, dynamic>);
              }
            } else if (obj is TypeError) {
              return const ServerError(
                  errorCode: ErrorCode.format, developerText: 'Format error');
            } else if (obj is FirebaseException) {
              return mapFireBaseError(obj);
            }
            return const ServerError(
                errorCode: ErrorCode.unknown, developerText: 'Unknown error');
          }),
        )
        .run();
  }
}

ServerError mapServerError(Map<String, dynamic> response) {
  try {
    return ServerError.fromJson(response);
  } catch (e) {
    return ServerError(
        errorCode: ErrorCode.unknown,
        developerText: '${response['error_code']} Unknown error');
  }
}

ServerError mapFireBaseError(FirebaseException obj) {
  switch (obj.code) {
    case 'aborted':
      return ServerError(
          errorCode: ErrorCode.aborted, developerText: obj.message);
    case 'already-exists':
      return ServerError(
          errorCode: ErrorCode.alreadyExists, developerText: obj.message);
    case 'canceled':
      return ServerError(
          errorCode: ErrorCode.cancelled, developerText: obj.message);
    case 'data-loss':
      return ServerError(
          errorCode: ErrorCode.dataLoss, developerText: obj.message);
    case 'deadline-exceeded':
      return ServerError(
          errorCode: ErrorCode.deadlineExceeded, developerText: obj.message);
    case 'failed-precondition':
      return ServerError(
          errorCode: ErrorCode.failedPrecondition, developerText: obj.message);
    case 'internal':
      return ServerError(
          errorCode: ErrorCode.internal, developerText: obj.message);
    case 'invalid-argument':
      return ServerError(
          errorCode: ErrorCode.invalidArgument, developerText: obj.message);
    case 'not-found':
      return ServerError(
          errorCode: ErrorCode.notFound, developerText: obj.message);
    case 'out-of-range':
      return ServerError(
          errorCode: ErrorCode.outOfRange, developerText: obj.message);
    case 'permission-denied':
      return ServerError(
          errorCode: ErrorCode.permissionDenied, developerText: obj.message);
    case 'resource-exhausted':
      return ServerError(
          errorCode: ErrorCode.resourceExhausted, developerText: obj.message);
    case 'unauthenticated':
      return ServerError(
          errorCode: ErrorCode.unauthenticated, developerText: obj.message);
    case 'unavailable':
      return ServerError(
          errorCode: ErrorCode.unavailable, developerText: obj.message);
    case 'unimplemented':
      return ServerError(
          errorCode: ErrorCode.unimplemented, developerText: obj.message);
    case 'unknown':
      return const ServerError(
          errorCode: ErrorCode.unknown, developerText: 'Unknown error');
    default:
      return const ServerError(
          errorCode: ErrorCode.unknown, developerText: 'Unknown error');
  }
}
