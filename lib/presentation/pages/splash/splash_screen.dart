import 'package:auto_route/auto_route.dart';
import 'package:example_flutter_app/config/app_config.dart';
import 'package:example_flutter_app/presentation/navigation/app_router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    AppConfig.init();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      AutoRouter.of(context).replace(const MainAppRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
