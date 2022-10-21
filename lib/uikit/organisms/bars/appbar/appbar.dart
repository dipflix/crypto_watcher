import 'package:crypto_watcher/uikit/styles/shadows.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  final Widget title;

  MainAppBar({
    Key? key,
    required this.title,
  })  : preferredSize = Size.fromHeight(48.0.h),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [AppShadows.mobileMenuShadow],
      ),
      child: AppBar(
        title: title,
        automaticallyImplyLeading: true,
      ),
    );
  }
}
