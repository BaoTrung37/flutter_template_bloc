import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fortune_teller/injection/di.dart';
import 'package:fortune_teller/l10n/app_localizations.dart';
import 'package:fortune_teller/presentation/app/cubit/app_cubit.dart';
import 'package:fortune_teller/presentation/utilities/enums/common/languages.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.app_name,
            ),
            ElevatedButton(
              onPressed: () {
                getIt<AppCubit>().changeLanguage(Languages.ko);
              },
              child: const Text('Change Language'),
            ),
          ],
        ),
      ),
    );
  }
}
