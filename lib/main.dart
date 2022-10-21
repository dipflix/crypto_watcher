import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'di/injector.dart';
import 'router/router.gr.dart';

const Size screenSize = Size(375, 812);

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  await Hive.initFlutter();

  configureDependencies();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  getIt.registerSingleton<AppRouter>(AppRouter());

  runApp(
    EasyLocalization(
      supportedLocales: const <Locale>[
        Locale('en'),
        Locale('ru'),
        Locale('ua'),
      ],
      startLocale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      child: const App(),
    ),
  );
}
