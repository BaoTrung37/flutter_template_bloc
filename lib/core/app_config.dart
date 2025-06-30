// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:example_flutter_app/core/infrastructure/bloc_observer/bloc_observer.dart';
import 'package:example_flutter_app/core/infrastructure/environment/env_keys.dart';
import 'package:example_flutter_app/core/infrastructure/firebase/firebase_options_dev.dart'
    as dev;
import 'package:example_flutter_app/core/infrastructure/firebase/firebase_options_prod.dart'
    as prod;
import 'package:example_flutter_app/injection/injection.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

class AppConfig {
  late Flavor flavor;
  late EnvKeys envKeys;
  Future<void> initialize() async {
    flavor = flavorEnum;
    await Future.wait([
      _initDependencies(),
      _initEnvKeys(),
      _initFirebase(),
      _initBloc(),
      _initHydratedBloc(),
    ]);
  }

  Future<void> _initFirebase() async {
    await Firebase.initializeApp(options: firebaseOptions);
    await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
    await FirebaseAppCheck.instance.activate(
      androidProvider:
          kDebugMode ? AndroidProvider.debug : AndroidProvider.playIntegrity,
      appleProvider: kDebugMode ? AppleProvider.debug : AppleProvider.appAttest,
    );
    await FirebaseAppCheck.instance.setTokenAutoRefreshEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  Future<void> _initEnvKeys() async {
    envKeys = EnvKeys();
    await envKeys.loadEnv(flavor);
  }

  Future<void> _initBloc() async {
    Bloc.observer = SimpleBlocObserver();
  }

  Future<void> _initHydratedBloc() async {
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: kIsWeb
          ? HydratedStorageDirectory.web
          : HydratedStorageDirectory((await getTemporaryDirectory()).path),
    );
  }

  Future<void> _initDependencies() async {
    await configureDependencies(this);
    await getIt.allReady();
  }

  String get title {
    switch (flavor) {
      case Flavor.dev:
        return 'Bt App Dev';
      case Flavor.prod:
        return 'Bt App';
    }
  }

  FirebaseOptions get firebaseOptions {
    switch (flavor) {
      case Flavor.dev:
        return dev.DefaultFirebaseOptions.currentPlatform;
      case Flavor.prod:
        return prod.DefaultFirebaseOptions.currentPlatform;
    }
  }
}

enum Flavor {
  dev,
  prod;
}

const flavor = String.fromEnvironment('FLAVOR');
Flavor get flavorEnum => flavor == 'prod' ? Flavor.prod : Flavor.dev;
