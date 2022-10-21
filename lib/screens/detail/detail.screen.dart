import 'package:crypto_watcher/di/injector.dart';
import 'package:crypto_watcher/router/router.gr.dart';
import 'package:crypto_watcher/shared/models/community_data/community_data.model.dart';
import 'package:crypto_watcher/shared/models/market/market.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../uikit/uikit.dart';

class CoinDetailScreen extends StatelessWidget {
  final MarketModel model;

  const CoinDetailScreen({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Theme.of(context).iconTheme.color,
        ),
        title: Row(
          children: [
            ImageNetwork(
              model.image,
              width: 24.w,
              height: 24.h,
            ),
            Gap.vertical.small(),
            TextBody(model.name)
          ],
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
