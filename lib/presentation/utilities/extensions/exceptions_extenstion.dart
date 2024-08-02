import 'package:fortune_teller/presentation/utilities/errors/app_error.dart';
import 'package:fortune_teller/presentation/utilities/logger/app_logger.dart';

extension ErrorExtension on Exception {
  String get message {
    return toString();
  }

  AppError? get appError {
    lg.e(message);
    return AppError(
      message: message,
    );
  }
}
