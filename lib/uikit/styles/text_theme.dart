import 'package:flutter/material.dart';

import 'fonts_size.dart';
import 'palette.dart';

const TextTheme textTheme = TextTheme(
  overline: TextStyle(
    decoration: TextDecoration.none,
  ),
  caption: TextStyle(
    fontSize: FontSize.caption,
    decoration: TextDecoration.none,
  ),
  button: TextStyle(
    color: Palette.white,
    decoration: TextDecoration.none,
  ),
  bodyText1: TextStyle(
    fontSize: FontSize.body,
    decoration: TextDecoration.none,
  ),
  bodyText2: TextStyle(
    decoration: TextDecoration.none,
  ),
  headline1: TextStyle(
    fontSize: FontSize.h1,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  ),
  headline2: TextStyle(
    fontSize: FontSize.h2,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
  ),
  headline3: TextStyle(
    fontSize: FontSize.h3,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
  ),
  headline4: TextStyle(
    fontSize: FontSize.h4,
    decoration: TextDecoration.none,
  ),
  headline5: TextStyle(
    fontSize: FontSize.h4,
    decoration: TextDecoration.none,
  ),
  headline6: TextStyle(
    decoration: TextDecoration.none,
  ),
  subtitle1: TextStyle(
    fontSize: FontSize.subtitleBody,
    decoration: TextDecoration.none,
  ),
  subtitle2: TextStyle(
    fontSize: FontSize.subtitleDescription,
    decoration: TextDecoration.none,
  ),
);