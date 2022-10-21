import 'package:crypto_watcher/bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:crypto_watcher/uikit/uikit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  late final MarketsBloc marketsBloc;

  HomeScreen({Key? key}) : super(key: key) {
    marketsBloc = MarketsBloc();
    _getCoins();
  }

  void _getCoins() {
    marketsBloc.add(
      MarketsEvent.getMarketCoins(
        currency: "USD",
        perPage: 10,
        sparkline: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: TextBody(
          "markets".tr(),
          fontSize: FontSize.body.h,
        ),
      ),
      body: BlocProvider.value(
        value: marketsBloc,
        child: RefreshIndicator(
          onRefresh: () async {
            _getCoins();
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.small.w),
              child: BlocBuilder<MarketsBloc, MarketsState>(
                builder: (context, state) {
                  return state.when(
                      loading: () => Center(child: CircularProgressIndicator()),
                      ready: (markets) {
                        final topCoin = markets.first;
                        final coins = markets.skip(1);

                        return Column(
                          children: [
                            Gap.horizontal.large(),
                            TopCoinComponent(
                              model: topCoin,
                            ),
                            Gap.horizontal.large(),
                            buildColumnList(
                              length: coins.length,
                              buildWidget: (index) =>
                                  MarketView(model: coins.elementAt(index)),
                              buildSpace: Gap.horizontal.regular,
                            ),
                          ],
                        );
                      },
                      error: (error) => TextBody(error.toString()));
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
