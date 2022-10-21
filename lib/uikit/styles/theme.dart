import 'package:crypto_watcher/uikit/uikit.dart';
import 'package:flutter/material.dart';

import 'text_theme.dart';

ThemeData materialTheme = ThemeData(
  useMaterial3: true,
  splashFactory: InkSplash.splashFactory,
  textTheme: textTheme.apply(
    fontFamily: 'Montserrat',
  ),
  fontFamily: 'Montserrat',
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Palette.white,
      elevation: 0,
    ),
  ),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleSpacing: 0,
    surfaceTintColor: Colors.transparent,
    shadowColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
  ),
);
