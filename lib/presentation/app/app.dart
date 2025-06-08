import 'package:example_flutter_app/core/application/language/language_bloc.dart';
import 'package:example_flutter_app/core/router/app_router.dart';
import 'package:example_flutter_app/core/theme/colors.dart';
import 'package:example_flutter_app/core/theme/providers/theme_provider.dart';
import 'package:example_flutter_app/core/theme/texts.dart';
import 'package:example_flutter_app/core/theme/universal_theme.dart';
import 'package:example_flutter_app/core/utilities/constants/app_constants.dart';
import 'package:example_flutter_app/injection/di.dart';
import 'package:example_flutter_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppConstants.designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: child,
      ),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      notifier: AppTheme.uniform(
        themeFactory: const UniversalThemeFactory(),
        lightColors: NikeColors.light(),
        darkColors: NikeColors.dark(),
        defaultMode: ThemeMode.light,
        textTheme: NikeTextTheme.build(),
      ),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        bloc: getIt<LanguageBloc>(),
        builder: (context, state) {
          return MaterialApp.router(
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeProvider.of(context).light,
            darkTheme: ThemeProvider.of(context).dark,
            themeMode: ThemeProvider.of(context).mode,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: getIt<AppRouter>().config(),
            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }
}
