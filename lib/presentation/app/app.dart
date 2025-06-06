import 'package:example_flutter_app/core/app_config.dart';
import 'package:example_flutter_app/core/constants/app_constants.dart';
import 'package:example_flutter_app/core/router/app_router.dart';
import 'package:example_flutter_app/core/theme/app_theme.dart';
import 'package:example_flutter_app/core/utilities/enums/common/languages.dart';
import 'package:example_flutter_app/injection/di.dart';
import 'package:example_flutter_app/l10n/app_localizations.dart';
import 'package:example_flutter_app/presentation/app/cubit/app_cubit.dart';
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
    return BlocProvider<AppCubit>(
      create: (contExt) => getIt<AppCubit>(),
      child: BlocBuilder<AppCubit, AppState>(
        buildWhen: (previous, current) =>
            previous.currentLanguage != current.currentLanguage,
        builder: (context, state) {
          return MaterialApp.router(
            title: getIt<AppConfig>().title,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: getThemeData(Brightness.light),
            locale: state.currentLanguage.locate,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: getIt<AppRouter>().config(),
            builder: EasyLoading.init(),
          );
        },
      ),
    );
  }
}
