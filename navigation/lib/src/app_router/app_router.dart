import 'package:auto_route/auto_route.dart';
import 'package:navigation/src/app_router/routes/routes.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'RouteWrapper,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: AuthorizationRoute.page, initial: true, path: '/'),
    AutoRoute(page: HomeRoute.page, path: '/home'),
  ];
}
