import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';

@injectable
class OnboardingGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    resolver.next(true);
  }
}
 