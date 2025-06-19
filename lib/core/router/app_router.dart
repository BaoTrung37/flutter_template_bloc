import 'package:auto_route/auto_route.dart';
import 'package:example_flutter_app/presentation/presentation.dart';
import 'package:injectable/injectable.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
@lazySingleton
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: '/',
          page: MainAppRoute.page,
          children: [
            RedirectRoute(path: '', redirectTo: HomeRoute.name),
            AutoRoute(
              path: 'home-page',
              page: HomeRoute.page,
            ),
            AutoRoute(
              path: 'profile-page',
              page: ProfileRoute.page,
            ),
          ],
        ),
        AutoRoute(
          path: '/setting-page',
          page: SettingRoute.page,
        ),
      ];
}
