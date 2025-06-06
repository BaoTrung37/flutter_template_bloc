import 'package:auto_route/auto_route.dart';
import 'package:example_flutter_app/config/router/navigation.dart';
import 'package:example_flutter_app/presentation/presentation.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter({super.navigatorKey});
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(
          page: MainAppRoute.page,
          children: [
            AutoRoute(
              page: HomeNavigationRoute.page,
              children: [
                AutoRoute(page: HomeRoute.page, initial: true),
              ],
            ),
            AutoRoute(
              page: MoreNavigationRoute.page,
              children: [
                AutoRoute(page: MoreRoute.page, initial: true),
              ],
            ),
          ],
        ),
      ];
}
