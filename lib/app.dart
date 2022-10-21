import 'package:crypto_watcher/bloc/bloc.dart';
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
  ThemeMode themeMode = ThemeMode.light;
  final AppRouter _appRouter = getIt<AppRouter>();
  late final ThemeCubit themeCubit;

  @override
  void initState() {
    themeCubit = getIt<ThemeCubit>();
    super.initState();
    themeCubit.stream.listen((event) {
      setState(() {
        themeMode = event.mode;
      });
    });
    // settingsBloc.add(const SettingsEvent.getTheme());
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: screenSize,
        builder: (BuildContext context, Widget? child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: themeCubit),
            ],
            child: MaterialApp.router(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: lightTheme(),
              themeMode: themeMode,
              // themeMode:
              //     state.themeType == 'night' ? ThemeMode.dark : ThemeMode.light,
              darkTheme: darkTheme(),
              debugShowCheckedModeBanner: false,
              title: 'Crypto Watcher',
              routerDelegate: _appRouter.delegate(),
              routeInformationParser: _appRouter.defaultRouteParser(),
            ),
          );
        });
  }

  ThemeData darkTheme() {
    return materialTheme.copyWith(
      scaffoldBackgroundColor: Palette.background,
      backgroundColor: Palette.background,
      primaryColor: Palette.tertriary,
      hintColor: Palette.white,
      focusColor: Palette.base1,
      iconTheme: IconThemeData(color: Palette.white),
      appBarTheme: materialTheme.appBarTheme.copyWith(
        color: Palette.background,
        titleTextStyle: textTheme.bodyText2!.copyWith(
          color: Palette.white,
        ),
        toolbarTextStyle: textTheme.bodyText2!.copyWith(
          color: Palette.white,
        ),
        iconTheme: IconThemeData(color: Palette.white),
      ),
      textTheme: textTheme.apply(
        fontFamily: 'Montserrat',
        bodyColor: Palette.white,
      ),
    );
  }

  ThemeData lightTheme() {
    return materialTheme.copyWith(
      scaffoldBackgroundColor: Palette.white,
      backgroundColor: Colors.white,
      primaryColor: Palette.primary,
      hintColor: Palette.background,
      focusColor: Palette.overlay2,
      textTheme: textTheme.apply(
        fontFamily: 'Montserrat',
        bodyColor: Palette.base1,
      ),
    );
  }
}
