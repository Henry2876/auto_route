import 'package:auto_route/auto_route.dart';
import 'package:navigation/src/app_router/routes/account_route_wrapper.dart';
import 'package:navigation/src/app_router/routes/main_route_wrapper.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'RouteWrapper,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: AccountRoute.page, initial: true,path: '/'),
    AutoRoute(page: MainRoute.page, path: '/main')
  ];
}
