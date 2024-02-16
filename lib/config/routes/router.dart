import 'package:auto_route/auto_route.dart';
import 'package:go_router_test/config/routes/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        path: '/',
        page: HomeRoute.page,
        children: [
          AutoRoute(
            path: '',
            page: HomeViewRoute.page,
          ),
          AutoRoute(
            path: 'details',
            page: DetailsRoute.page,
          ),
        ],
      ),
      AutoRoute(
        path: '/details/about',
        page: AboutRoute.page,
      ),
    ];
  }
}

final router = AppRouter();
