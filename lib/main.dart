import 'dart:async';
import 'dart:io';

import 'package:example_flutter_app/core/app_config.dart';
import 'package:example_flutter_app/presentation/app/app.dart';
import 'package:flutter/material.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

FutureOr<void> mainApp(Flavor flavor) async {
  Future<void> startApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    HttpOverrides.global = MyHttpOverrides();

    final appConfig = AppConfig(flavor: flavor);
    await appConfig.initialize();

    runApp(const App());
  }

  await runZonedGuarded(() async {
    await startApp();
  }, (Object error, StackTrace stackTrace) {
    // AppLogger.instance.logD('runZonedGuarded Error: $error');
  });
}
