import 'dart:math';

import 'package:crypto_watcher/bloc/bloc.dart';
import 'package:crypto_watcher/shared/models/market/market.model.dart';
import 'package:crypto_watcher/uikit/molecules/coin_image/coin_image.dart';
import 'package:crypto_watcher/uikit/uikit.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopCoinComponent extends StatelessWidget {
  final MarketModel model;
  late final ImageCubit imageCubit;

  TopCoinComponent({
    Key? key,
    required this.model,
  }) : super(key: key) {
    imageCubit = ImageCubit(model.image)..process();
  }

  String get formattedPrice => '${model.currentPrice.toStringAsFixed(3)}';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider.value(
      value: imageCubit,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.regural),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<ImageCubit, ImageState>(
                  builder: (context, state) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: state.when(
                              loading: () => Palette.overlay2,
                              ready: (color, _, __) => color.withOpacity(0.5),
                            ),
                            blurRadius: 80,
                            offset: Offset(0, 10),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(
                          Sizes.borderMedium,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          Sizes.borderMedium,
                        ),
                        child: CoinImage(
                          dimension: 84,
                        ),
                      ),
                    );
                  },
                ),
                Gap.vertical.regular(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBody.bold(
                      model.name,
                      fontSize: FontSize.h2,
                    ),
                    TextBody.bold(
                      model.symbol.toUpperCase(),
                      fontSize: FontSize.caption,
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    PricePercentageCaption(
                      percentage: model.priceChangePercentage,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gap.horizontal.regular(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextBody.extraBold(
                "${'usd'.toUpperCase()}",
              ),
              TextBody.bold(
                formattedPrice,
                fontSize: FontSize.h1,
              ),
            ],
          ),
          Gap.horizontal.small(),
          Padding(
            padding: const EdgeInsets.only(top: 48, left: 8, right: 8),
            child: SizedBox(
              height: ScreenUtils.width / 2.5,
              width: double.infinity,
              child: SparklineWidget(
                sparkline: model.sparkline?.price.toList() ?? [],
                showBarArea: false,
                pricePercentage: model.priceChangePercentage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
