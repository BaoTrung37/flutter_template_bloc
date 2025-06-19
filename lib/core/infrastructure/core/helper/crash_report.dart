import 'package:catcher_2/catcher_2.dart';
import 'package:catcher_2/model/platform_type.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class CrashlyticsHandler extends ReportHandler {
  CrashlyticsHandler({
    this.enableDeviceParameters = true,
    this.enableApplicationParameters = true,
    this.enableCustomParameters = true,
    this.printLogs = true,
  });
  final Logger _logger = Logger('CrashlyticsHandler');
  final bool enableDeviceParameters;
  final bool enableApplicationParameters;
  final bool enableCustomParameters;
  final bool printLogs;

  @override
  List<PlatformType> getSupportedPlatforms() {
    return [PlatformType.android, PlatformType.iOS];
  }

  @override
  Future<bool> handle(Report report, BuildContext? context) async {
    try {
      _printLog('Sending crashlytics report');
      final crashlytics = FirebaseCrashlytics.instance;
      // crashlytics.enableInDevMode = true;
      await crashlytics.log(_getLogMessage(report));
      if (report.errorDetails != null) {
        await crashlytics.recordFlutterError(report.errorDetails!);
      } else {
        await crashlytics.recordError(
          report.error,
          report.stackTrace as StackTrace?,
        );
      }
      _printLog('Crashlytics report sent');
      return true;
    } catch (exception) {
      _printLog('Failed to send crashlytics report: $exception');
      return false;
    }
  }

  String _getLogMessage(Report report) {
    final buffer = StringBuffer();
    if (enableDeviceParameters) {
      buffer.write('||| Device parameters ||| ');
      for (final entry in report.deviceParameters.entries) {
        buffer.write('${entry.key}: ${entry.value} ');
      }
    }
    if (enableApplicationParameters) {
      buffer.write('||| Application parameters ||| ');
      for (final entry in report.applicationParameters.entries) {
        buffer.write('${entry.key}: ${entry.value} ');
      }
    }
    if (enableCustomParameters) {
      buffer.write('||| Custom parameters ||| ');
      for (final entry in report.customParameters.entries) {
        buffer.write('${entry.key}: ${entry.value} ');
      }
    }
    return buffer.toString();
  }

  void _printLog(String log) {
    if (printLogs) {
      _logger.info(log);
    }
  }
}
