import 'dart:async';

import 'package:example_flutter_app/config/app_config.dart';
import 'package:example_flutter_app/config/bloc_observer/bloc_observer.dart';
import 'package:example_flutter_app/config/environment/env_keys.dart';
import 'package:example_flutter_app/injection/di.dart';
import 'package:example_flutter_app/presentation/app/app.dart';
import 'package:example_flutter_app/presentation/utilities/logger/app_logger.dart';
import 'package:example_flutter_app/presentation/utilities/services/notification/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

FutureOr<void> mainApp(Flavor flavor) async {
  //
  Future<void> startApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    final appConfig = AppConfig(
      flavor: flavor,
    );

    await EnvKeys.loadEnv(flavor);

    Bloc.observer = MyBlocObserver();

    await configureDependencies(appConfig);

    await getIt.allReady();

    await NotificationService.instance.initialize(
      onDidReceiveLocalNotification: (id, title, body, payload) async {
        lg.d('onDidReceiveLocalNotification: $id, $title, $body, $payload');
      },
      onDidReceiveNotificationResponse: (response) async {
        lg.d('onDidReceiveNotificationResponse: $response');
      },
    );
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
    //
    lg.e('runZonedGuarded Error: $error');
  });
}
