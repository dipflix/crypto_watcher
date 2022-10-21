import 'dart:math' as math;

import 'package:crypto_watcher/di/injector.dart';
import 'package:crypto_watcher/router/router.gr.dart';
import 'package:crypto_watcher/shared/models/market/market.model.dart';
import 'package:crypto_watcher/uikit/molecules/coin_image/coin_image.dart';
import 'package:crypto_watcher/uikit/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:crypto_watcher/bloc/bloc.dart';

class MarketView extends StatelessWidget {
  final MarketModel model;
  late final ImageCubit imageCubit;

  MarketView({
    Key? key,
    required this.model,
  }) : super(key: key) {
    imageCubit = ImageCubit(model.image)..process();
  }

  final AppRouter appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return FlattedCard(
      child: InkWell(
        onTap: () {
          appRouter.push(CoinDetailRoute(model: model));
        },
        borderRadius: BorderRadius.circular(17),
        excludeFromSemantics: true,
        child: BlocProvider.value(
          value: imageCubit,
          child: Semantics(
            label: model.name,
            child: SizedBox(
              height: 85.sp,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(Sizes.borderSmall),
                      child: CoinImage(
                        dimension: 48,
                      ),
                    ),
                    Gap.vertical.regular(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBody.bold(
                          model.name.length > 12
                              ? model.name.replaceRange(
                                  12,
                                  model.name.length,
                                  '...',
                                )
                              : model.name,
                          fontSize: FontSize.body.sp,
                        ),
                        TextBody.thin(
                          '${model.symbol.toUpperCase()}',
                          fontSize: FontSize.caption.sp,
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextBody.bold(
                          formattedPrice,
                          fontSize: FontSize.h4.sp,
                        ),
                        Spacer(),
                        PricePercentageCaption(
                          percentage: model.priceChangePercentage,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String get formattedPrice =>
      '${model.currentPrice.toStringAsFixed(2)} ${'usd'.toUpperCase()}';
}
