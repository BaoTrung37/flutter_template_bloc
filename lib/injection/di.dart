import 'package:flutter/material.dart';
import 'package:fortune_teller/injection/di.config.dart';
import 'package:fortune_teller/presentation/navigation/app_router.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

@InjectableInit(
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() {
  getIt.init();
  getIt.registerSingleton(AppRouter(navigatorKey: navigatorKey));
}
