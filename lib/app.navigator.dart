import 'package:auto_route/auto_route.dart';
import 'package:crypto_watcher/router/router.gr.dart';
import 'package:crypto_watcher/uikit/styles/shadows.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:iconsax/iconsax.dart';

class AppNavigatorWrapper extends StatelessWidget {
  const AppNavigatorWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AutoTabsScaffold(
      backgroundColor: theme.backgroundColor,
      homeIndex: 0,
      routes: [
        HomeRouter(),
        MarketRouter(),
        SettingsRouter(),
      ],
      builder:
          (BuildContext context, Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
        return DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [AppShadows.mobileMenuShadow],
          ),
          child: BottomNavigationBar(
            onTap: tabsRouter.setActiveIndex,
            selectedItemColor: theme.primaryColor,
            unselectedItemColor: theme.hintColor,
            backgroundColor: theme.scaffoldBackgroundColor,
            iconSize: 32,
            items: [
              BottomNavigationBarItem(
                activeIcon: DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: AppShadows.primary,
                  ),
                  child: Icon(
                    Iconsax.home_trend_up,
                    color: theme.primaryColor,
                  ),
                ),
                icon: Icon(
                  Iconsax.home_trend_up,
                  color: theme.hintColor,
                ),
                label: 'ratings'.tr(),
              ),
              BottomNavigationBarItem(
                activeIcon: DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: AppShadows.primary,
                  ),
                  child: Icon(
                    Iconsax.chart_2,
                    color: theme.primaryColor,
                  ),
                ),
                icon: Icon(
                  Iconsax.chart_2,
                  color: theme.hintColor,
                ),
                label: 'market'.tr(),
              ),
              BottomNavigationBarItem(
                activeIcon: DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: AppShadows.primary,
                  ),
                  child: Icon(
                    Iconsax.setting_3,
                    color: theme.primaryColor,
                  ),
                ),
                icon: Icon(
                  Iconsax.setting_3,
                  color: theme.hintColor,
                ),
                label: 'settings'.tr(),
              ),
            ],
            currentIndex: tabsRouter.activeIndex,
          ),
        );
      },
    );
  }
}
