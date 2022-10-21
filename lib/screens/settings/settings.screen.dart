import 'package:crypto_watcher/app.dart';
import 'package:crypto_watcher/bloc/bloc.dart';
import 'package:crypto_watcher/di/injector.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:crypto_watcher/uikit/uikit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextBody.semiBold(
          "settings".tr(),
          fontSize: FontSize.h4,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ElevatedButton(
                onPressed: () {
                  context.read<ThemeCubit>().switchTheme();
                },
                child: TextBody("Switch theme"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
