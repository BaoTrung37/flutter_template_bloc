import 'package:auto_route/auto_route.dart';
import 'package:example_flutter_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

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
              AppLocalizations.of(context)!.appName,
            ),
          ],
        ),
      ),
    );
  }
}
