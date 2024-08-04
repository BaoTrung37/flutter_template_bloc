// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:example_flutter_app/config/environment/env_keys.dart';
import 'package:example_flutter_app/config/firebase/firebase_options_dev.dart'
    as dev;
import 'package:example_flutter_app/config/firebase/firebase_options_prod.dart'
    as prod;
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

enum Flavor {
  dev,
  prod;
}

class AppConfig {
  final Flavor flavor;
  AppConfig({
    required this.flavor,
  });

  String get name => flavor.name;

  Future<void> init() async {
    await _initFirebase();
  }

  Future<void> _initFirebase() async {
    await Firebase.initializeApp(
      options: firebaseOptions,
    );
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

  String get title {
    switch (flavor) {
      case Flavor.dev:
        return 'App Dev';
      case Flavor.prod:
        return 'App';
      default:
        return 'App';
    }
  }

  EnvironmentAttribute get environmentAttribute {
    switch (flavor) {
      case Flavor.dev:
        return EnvironmentAttribute.devApp();
      case Flavor.prod:
        return EnvironmentAttribute.prodApp();
      default:
        return EnvironmentAttribute.devApp();
    }
  }

  FirebaseOptions get firebaseOptions {
    switch (flavor) {
      case Flavor.dev:
        return dev.DefaultFirebaseOptions.currentPlatform;
      case Flavor.prod:
        return prod.DefaultFirebaseOptions.currentPlatform;
      default:
        return dev.DefaultFirebaseOptions.currentPlatform;
    }
  }

  String get baseUrl => environmentAttribute.baseUrl;
  bool get isDevelopment => environmentAttribute.isDevelopment;
  bool get isProduction => environmentAttribute.isProduction;
}

class EnvironmentAttribute {
  EnvironmentAttribute.devApp() : appEnvironment = Flavor.dev;

  EnvironmentAttribute.prodApp() : appEnvironment = Flavor.prod;
  final Flavor appEnvironment;

  String get baseUrl => EnvKeys.baseUrl;
  bool get isDevelopment => appEnvironment == Flavor.dev;
  bool get isProduction => appEnvironment == Flavor.prod;
}
