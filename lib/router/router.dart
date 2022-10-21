import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:crypto_watcher/app.navigator.dart';
import 'package:crypto_watcher/screens/detail/detail.screen.dart';

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
            CustomRoute(
              path: '',
              page: HomeScreen,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
            CustomRoute(
              path: 'coinDetail',
              page: CoinDetailScreen,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
          ],
        ),
        AutoRoute(
          name: "MarketRouter",
          path: 'market',
          page: EmptyRouterScreen,
          children: [
            CustomRoute(
              path: '',
              page: MarketScreen,
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
          ],
        ),
        AutoRoute(
          name: "SettingsRouter",
          path: 'settings',
          page: EmptyRouterScreen,
          children: [
            CustomRoute(
              page: SettingScreen,
              path: '',
              transitionsBuilder: TransitionsBuilders.noTransition,
            ),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
