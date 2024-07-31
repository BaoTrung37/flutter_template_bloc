import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fortune_teller/config/app_config.dart';
import 'package:fortune_teller/config/constants/app_constants.dart';
import 'package:fortune_teller/injection/di.dart';
import 'package:fortune_teller/l10n/app_localizations.dart';
import 'package:fortune_teller/presentation/app/cubit/app_cubit.dart';
import 'package:fortune_teller/presentation/navigation/app_router.dart';
import 'package:fortune_teller/presentation/utilities/enums/common/languages.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final appCubit = getIt<AppCubit>();
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
      child: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocProvider<AppCubit>(
      create: (context) => appCubit,
      lazy: false,
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: AppConfig.getUrl,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            locale: state.currentLanguage.locate,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: getIt<AppRouter>().config(),
          );
        },
      ),
    );
  }
}
