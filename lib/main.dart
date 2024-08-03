import 'dart:async';

import 'package:example_flutter_app/config/bloc_observer/bloc_observer.dart';
import 'package:example_flutter_app/injection/di.dart';
import 'package:example_flutter_app/presentation/app/app.dart';
import 'package:example_flutter_app/presentation/utilities/logger/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
