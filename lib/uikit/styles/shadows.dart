import 'package:crypto_watcher/uikit/styles/palette.dart';
import 'package:flutter/material.dart';

class AppShadows {
  static List<BoxShadow> get common => [
        BoxShadow(
          color: const Color(0x0018274B).withOpacity(0.1),
          blurRadius: 14,
          spreadRadius: -6,
          offset: const Offset(0, 8),
        ),
        BoxShadow(
          color: const Color(0x0018274B).withOpacity(0.08),
          blurRadius: 32,
          spreadRadius: -4,
          offset: const Offset(0, 12),
        ),
      ];

  static BoxShadow get mobileMenuShadow => BoxShadow(
        color: const Color(0x0029282C).withOpacity(0.15),
        blurRadius: 23,
        spreadRadius: -7,
        offset: const Offset(0, 0),
      );

  static List<BoxShadow> get box => [
        BoxShadow(
          color: const Color(0x00000000).withOpacity(0.05),
          blurRadius: 20,
          spreadRadius: 0,
          offset: const Offset(0, 5),
        )
      ];

  static List<BoxShadow> get primary => [
    BoxShadow(
      color: Palette.primary.withOpacity(0.2),
      blurRadius: 20,
      spreadRadius: 0,
      offset: const Offset(0, 3),
    )
  ];
}
//0 5px 20px 0 rgba(0,0,0,var(--vs-shadow-opacity))
