import 'package:crypto_watcher/uikit/atoms/atoms.dart';
import 'package:crypto_watcher/uikit/styles/fonts_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextBody.semiBold(
          "market".tr(),
          fontSize: FontSize.h4,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
