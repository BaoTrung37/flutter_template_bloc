import 'dart:async';
import 'dart:io';

import 'package:catcher_2/catcher_2.dart';
import 'package:example_flutter_app/core/app_config.dart';
import 'package:example_flutter_app/presentation/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  HttpOverrides.global = MyHttpOverrides();

  final appConfig = AppConfig();
  await appConfig.initialize();

  final debugOptions = Catcher2Options(SilentReportMode(), [
    ToastHandler(
      customMessage: 'An error occurred. Please try again!',
      textSize: 14,
    ),
    ConsoleHandler(),
    // CrashlyticsHandler(),
  ]);
  final releaseOptions = Catcher2Options(SilentReportMode(), [
    // CrashlyticsHandler(),
  ]);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    Catcher2(
      rootWidget: const App(),
      debugConfig: debugOptions,
      releaseConfig: releaseOptions,
    );
  });

  runApp(const App());

  FlutterNativeSplash.remove();
}
