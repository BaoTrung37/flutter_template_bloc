import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fortune_teller/config/bloc_observer/bloc_observer.dart';
import 'package:fortune_teller/injection/di.dart';
import 'package:fortune_teller/presentation/app/app.dart';
import 'package:fortune_teller/presentation/utilities/logger/app_logger.dart';

FutureOr<void> main() async {
  //
  Future<void> startApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    Bloc.observer = MyBlocObserver();
    await configureDependencies();
    await getIt.allReady();

    runApp(const App());
  }

  runZonedGuarded(() async {
    startApp();
  }, (Object error, StackTrace stackTrace) {
    //
    lg.e('runZonedGuarded Error: $error');
  });
}
