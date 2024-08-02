import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:fortune_teller/config/firebase/firebase_options_dev.dart'
    as dev;
import 'package:fortune_teller/config/firebase/firebase_options_prod.dart'
    as prod;
import 'package:fortune_teller/data/services/network_service/common/api_constants.dart';

enum Flavor {
  dev,
  prod,
}

class AppConfig {
  AppConfig._private();
  static Flavor? flavor;

  static String get name => flavor?.name ?? '';

  static Future<void> init() async {
    switch (flavor) {
      case Flavor.dev:
        break;
      case Flavor.prod:
        break;
      default:
        break;
    }

    await _initFirebase();
  }

  static _initFirebase() async {
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
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  static String get title {
    switch (flavor) {
      case Flavor.dev:
        return 'App Dev';
      case Flavor.prod:
        return 'App';
      default:
        return 'App';
    }
  }

  static EnvironmentAttribute get environmentAttribute {
    switch (flavor) {
      case Flavor.dev:
        return EnvironmentAttribute.devApp();
      case Flavor.prod:
        return EnvironmentAttribute.prodApp();
      default:
        return EnvironmentAttribute.devApp();
    }
  }

  static FirebaseOptions get firebaseOptions {
    switch (flavor) {
      case Flavor.dev:
        return dev.DefaultFirebaseOptions.currentPlatform;
      case Flavor.prod:
        return prod.DefaultFirebaseOptions.currentPlatform;
      default:
        return dev.DefaultFirebaseOptions.currentPlatform;
    }
  }

  static String get getUrl => environmentAttribute.apiBaseUrl;
  static bool get isDevelopment => environmentAttribute.isDevelopment;
  static bool get isProduction => environmentAttribute.isProduction;
}

class EnvironmentAttribute {
  final String apiBaseUrl;
  final Flavor appEnvironment;

  EnvironmentAttribute.devApp()
      : apiBaseUrl = ApiConstants.devBaseUrl,
        appEnvironment = Flavor.dev;

  EnvironmentAttribute.prodApp()
      : apiBaseUrl = ApiConstants.prodBaseUrl,
        appEnvironment = Flavor.prod;

  bool get isDevelopment => appEnvironment == Flavor.dev;
  bool get isProduction => appEnvironment == Flavor.prod;
}
