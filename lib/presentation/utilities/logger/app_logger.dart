import 'dart:async';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:example_flutter_app/presentation/utilities/logger/app_zipper.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class LogFilePathProvider {
  static String logDir = 'app/logs';
  static String zipDir = 'app/zip';
  static String zipFileName = 'app-logs.zip';
  static String deviceInfo = 'device_info.txt';

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static Future<File> get localLogFile async {
    final path = await _localPath;
    final directory = Directory('$path/$logDir');
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    final nameFile = 'app-${_getCurrentDayOnWeekName()}';
    return File('${directory.path}/$nameFile.txt');
  }

  static Future<File> get nextLocalLogFile async {
    final path = await _localPath;
    final directory = Directory('$path/$logDir');
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    final nameFile = 'app-${_getNextDayOnWeekName()}';
    return File('${directory.path}/$nameFile.txt');
  }

  static Future<File> get deviceInfoFile async {
    final path = await _localPath;
    final directory = Directory('$path/$logDir');
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
    return File('${directory.path}/$deviceInfo');
  }

  static Future<void> deleteLocalLogFile() async {
    final file = await localLogFile;
    await file.delete();
  }

  static Future<void> clearLocalLogFile() async {
    final file = await localLogFile;
    await file.writeAsString('');
  }

  static String _getNameOfDay(int day) {
    switch (day) {
      case DateTime.monday:
        return 'monday';
      case DateTime.tuesday:
        return 'tuesday';
      case DateTime.wednesday:
        return 'wednesday';
      case DateTime.thursday:
        return 'thursday';
      case DateTime.friday:
        return 'friday';
      case DateTime.saturday:
        return 'saturday';
      case DateTime.sunday:
        return 'sunday';
      default:
        return 'Unknown';
    }
  }

  static String _getCurrentDayOnWeekName() {
    final date = DateTime.now();
    final day = date.weekday;
    final name = _getNameOfDay(day);
    return name;
  }

  static String _getNextDayOnWeekName() {
    final date = DateTime.now().add(const Duration(days: 2));
    final day = date.weekday;
    final name = _getNameOfDay(day);
    return name;
  }

  static Future<File?> zipLogFiles() async {
    final path = await _localPath;
    const zipFileName = 'app-logs.zip';
    final sourceDirPath = '$path/$logDir';
    final zipFilePath = '$path/$zipDir/$zipFileName';

    try {
      zipFolder(sourceDirPath, zipFilePath);
      return File(zipFilePath);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}

class AppLogger {
  AppLogger._();

  static final AppLogger _instance = AppLogger._();
  static AppLogger get instance => _instance;

  late final StreamController<OutputEvent> controller;
  late final Logger _lg;

  void init() {
    controller = StreamController<OutputEvent>();
    _lg = Logger(
      level: Level.all,
      filter: ProductionFilter(),
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 80,
        colors: true,
        printEmojis: true,
        dateTimeFormat: DateTimeFormat.dateAndTime,
      ),
      output: (!kDebugMode) ? _CustomFileOutput(controller: controller) : null,
    );

    controller.stream.listen((event1) async {
      for (final line in event1.lines) {
        await _logMessage(line);
      }
      await _clearPastDayMessage();
      await _logDeviceInfo();
    });
  }

  void dispose() {
    if (!kDebugMode) {
      controller.close();
    }
  }

  void logD(dynamic message) => _lg.d(message);

  void logI(dynamic message) => _lg.i(message);
  void logE(
    dynamic message, {
    StackTrace? stackTrace,
  }) =>
      _lg.e(message, stackTrace: stackTrace);
  Future<void> readLogPath() async {
    try {
      final file = await LogFilePathProvider.localLogFile;
      debugPrint('file: ${file.path}');
    } catch (e) {
      debugPrint('Error reading log file: $e');
    }
  }

  Future<void> _logMessage(String message) async {
    try {
      final localLogFile = await LogFilePathProvider.localLogFile;
      await localLogFile.writeAsString(
        '$message\n',
        mode: FileMode.writeOnlyAppend,
        flush: true,
      );
    } catch (error) {
      debugPrint('Error writing log: $error');
    }
  }

  Future<void> _clearPastDayMessage() async {
    try {
      final nextLocalLogFile = await LogFilePathProvider.nextLocalLogFile;
      await nextLocalLogFile.writeAsString('');
      debugPrint('Log cleared');
    } catch (error) {
      debugPrint('Error clearing log: $error');
    }
  }

  Future<void> _logDeviceInfo() async {
    try {
      var deviceInfoString = '';
      final deviceInfo = DeviceInfoPlugin();
      final iosInfo = await deviceInfo.iosInfo;
      for (final entry in iosInfo.data.entries) {
        deviceInfoString += '${entry.key}: ${entry.value}\n';
      }
      final deviceInfoFile = await LogFilePathProvider.deviceInfoFile;
      await deviceInfoFile.writeAsString(
        deviceInfoString,
        mode: FileMode.write,
      );
    } catch (error) {
      debugPrint('Error writing log: $error');
    }
  }
}

class _CustomFileOutput extends LogOutput {
  _CustomFileOutput({required this.controller});
  final StreamController<OutputEvent> controller;
  @override
  Future<void> output(OutputEvent event) async {
    controller.sink.add(event);
  }
}
