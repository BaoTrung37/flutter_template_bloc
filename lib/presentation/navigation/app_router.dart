import 'package:auto_route/auto_route.dart';
import 'package:fortune_teller/presentation/navigation/navigation_pages/navigation_pages.dart';
import 'package:fortune_teller/presentation/pages/pages.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
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
