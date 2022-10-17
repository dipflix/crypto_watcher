import 'package:crypto_watcher/router/router.gr.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'di/injector.dart';
import 'main.dart';
import 'uikit/uikit.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  //final SettingsBloc settingsBloc = getIt.get();
  String? themeType;
  final AppRouter _appRouter = AppRouter();

  @override
  void initState() {
    super.initState();
    // settingsBloc.add(const SettingsEvent.getTheme());
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: screenSize,
        builder: (BuildContext context, Widget? child) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: materialTheme().copyWith(
              scaffoldBackgroundColor: Colors.white,
              primaryColor: Palette.overlay1,
              hintColor: Palette.background,
              focusColor: Palette.tertriary,
              textTheme: textTheme.apply(
                fontFamily: 'Montserrat',
                bodyColor: Palette.base1,
              ),
            ),
            themeMode: ThemeMode.dark,
            // themeMode:
            //     state.themeType == 'night' ? ThemeMode.dark : ThemeMode.light,
            darkTheme: materialTheme().copyWith(
              scaffoldBackgroundColor: Palette.background,
              primaryColor: Palette.base1,
              hintColor: Palette.white,
              focusColor: Palette.primary,
              textTheme: textTheme.apply(
                fontFamily: 'Montserrat',
                bodyColor: Palette.white,
              ),
            ),
            debugShowCheckedModeBanner: false,
            title: 'Crypto Watcher',
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
          );
        });
  }
}
