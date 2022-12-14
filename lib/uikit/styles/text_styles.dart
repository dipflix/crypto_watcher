import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'palette.dart';

// ignore: avoid_classes_with_only_static_members
class TextStyles {
  static TextStyle tabText = TextStyle(
    fontSize: 16.sp,
  );

  static TextStyle semiBold14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBold16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle semiBold24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
  );
  static TextStyle whiteSemiBold11 = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
    color: Palette.overlay1,
  );
  static TextStyle overlay3Bold11 = TextStyle(
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
    color: Palette.overlay3,
  );
  static TextStyle overlay3Bold14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: Palette.overlay3,
  );
}
