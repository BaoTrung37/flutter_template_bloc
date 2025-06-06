import 'dart:async';
import 'dart:io';

import 'package:example_flutter_app/core/app_config.dart';
import 'package:example_flutter_app/core/infrastructure/bloc_observer/bloc_observer.dart';
import 'package:example_flutter_app/core/infrastructure/environment/env_keys.dart';
import 'package:example_flutter_app/injection/di.dart';
import 'package:example_flutter_app/presentation/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

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
    final appConfig = AppConfig(
      flavor: flavor,
    );

    await EnvKeys.loadEnv(flavor);

    Bloc.observer = MyBlocObserver();

    await configureDependencies(appConfig);

    await getIt.allReady();

    runApp(const App());

    EasyLoading.instance
      ..backgroundColor = Colors.transparent
      ..boxShadow = <BoxShadow>[]
      ..indicatorColor = Colors.grey
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..indicatorSize = 40
      ..maskType = EasyLoadingMaskType.black
      ..textColor = Colors.grey
      ..progressColor = Colors.grey
      ..loadingStyle = EasyLoadingStyle.custom;
  }

  await runZonedGuarded(() async {
    await startApp();
  }, (Object error, StackTrace stackTrace) {
    // AppLogger.instance.logD('runZonedGuarded Error: $error');
  });
}
