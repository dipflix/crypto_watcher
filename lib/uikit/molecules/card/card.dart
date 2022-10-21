import 'package:crypto_watcher/bloc/bloc.dart';
import 'package:crypto_watcher/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class FlattedCard extends StatelessWidget {
  final Widget child;

  const FlattedCard({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeMode = context.read<ThemeCubit>().state.mode;

    return Ink(
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        boxShadow: AppShadows.box,
        borderRadius: BorderRadius.circular(18),
        border: themeMode == ThemeMode.dark
            ? Border.all(
                color: Palette.overlay4,
              )
            : null,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: child,
      ),
    );
  }
}
