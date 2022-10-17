import 'package:auto_route/auto_route.dart';
import 'package:crypto_watcher/router/router.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppNavigatorWrapper extends StatelessWidget {
  const AppNavigatorWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: Theme.of(context).primaryColor,
      homeIndex: 0,
      routes: [
        HomeRouter(),
        MarketRouter(),
        SettingsRouter(),
      ],
      builder:
          (BuildContext context, Widget child, Animation<double> animation) {
        return Scaffold(
          body: SafeArea(
            child: child,
          ),
        );
      },
      bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
        return BottomNavigationBar(
          onTap: tabsRouter.setActiveIndex,
          selectedItemColor: Theme.of(context).focusColor,
          unselectedItemColor: Theme.of(context).hintColor,
          backgroundColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.bar_chart,
                color: Theme.of(context).focusColor,
              ),
              icon: Icon(
                Icons.bar_chart,
                color: Theme.of(context).hintColor,
              ),
              label: 'ratings'.tr(),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.pie_chart,
                color: Theme.of(context).focusColor,
              ),
              icon: Icon(
                Icons.pie_chart,
                color: Theme.of(context).hintColor,
              ),
              label: 'market'.tr(),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.manage_accounts,
                color: Theme.of(context).focusColor,
              ),
              icon: Icon(
                Icons.manage_accounts,
                color: Theme.of(context).hintColor,
              ),
              label: 'settings'.tr(),
            ),
          ],
          currentIndex: tabsRouter.activeIndex,
        );
      },
    );
  }
}
