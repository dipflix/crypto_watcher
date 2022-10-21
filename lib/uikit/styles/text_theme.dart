import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'fonts_size.dart';
import 'palette.dart';

TextTheme textTheme = TextTheme(
  overline: TextStyle(
    decoration: TextDecoration.none,
  ),
  caption: TextStyle(
    fontSize: FontSize.caption.sp,
    decoration: TextDecoration.none,
  ),
  button: TextStyle(
    color: Palette.white,
    decoration: TextDecoration.none,
  ),
  bodyText1: TextStyle(
    fontSize: FontSize.body.sp,
    decoration: TextDecoration.none,
  ),
  bodyText2: TextStyle(
    decoration: TextDecoration.none,
  ),
  headline1: TextStyle(
    fontSize: FontSize.h1.sp,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  ),
  headline2: TextStyle(
    fontSize: FontSize.h2.sp,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
  ),
  headline3: TextStyle(
    fontSize: FontSize.h3.sp,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
  ),
  headline4: TextStyle(
    fontSize: FontSize.h4.sp,
    decoration: TextDecoration.none,
  ),
  headline5: TextStyle(
    fontSize: FontSize.h4.sp,
    decoration: TextDecoration.none,
  ),
  headline6: TextStyle(
    decoration: TextDecoration.none,
  ),
  subtitle1: TextStyle(
    fontSize: FontSize.subtitleBody.sp,
    decoration: TextDecoration.none,
  ),
  subtitle2: TextStyle(
    fontSize: FontSize.subtitleDescription.sp,
    decoration: TextDecoration.none,
  ),
);
