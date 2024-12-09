import 'package:auto_route/auto_route.dart';
import 'package:goods_belt/core/navigation/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: AuthRoute.page),
    AutoRoute(page: ProfileRoute.page),
    AutoRoute(page: ProductsListRoute.page),
  ];
}