import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:crypto_watcher/app.navigator.dart';

import 'package:crypto_watcher/screens/screens.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: AppNavigatorWrapper,
      children: [
        AutoRoute(
          name: "HomeRouter",
          path: 'home',
          page: EmptyRouterScreen,
          children: [
            AutoRoute(
              path: '',
              page: HomeScreen,
            ),
          ],
        ),
        AutoRoute(
          name: "MarketRouter",
          path: 'market',
          page: EmptyRouterScreen,
          children: [
            AutoRoute(
              path: '',
              page: MarketScreen,
            ),
          ],
        ),
        AutoRoute(
          name: "SettingsRouter",
          path: 'settings',
          page: EmptyRouterScreen,
          children: [
            AutoRoute(
              path: '',
              page: SettingScreen,
            ),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
