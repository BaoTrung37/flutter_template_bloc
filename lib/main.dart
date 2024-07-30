import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortune_teller/config/app_config.dart';
import 'package:fortune_teller/config/bloc_observer/bloc_observer.dart';
import 'package:fortune_teller/presentation/app/app.dart';

FutureOr<void> main() async {
  //
  Future<void> startApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    await AppConfig.init();

    Bloc.observer = MyBlocObserver();
    runApp(const App());
  }

  runZonedGuarded(() {
    startApp();
  }, (Object error, StackTrace stackTrace) {});
}
