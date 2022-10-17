import 'package:crypto_watcher/bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:crypto_watcher/uikit/uikit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  late final MarketsBloc marketsBloc;

  HomeScreen({Key? key}) : super(key: key) {
    marketsBloc = MarketsBloc();
    marketsBloc.add(MarketsEvent.getMarketCoins(currency: "USD"));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: marketsBloc,
        child: SingleChildScrollView(
          child: BlocBuilder<MarketsBloc, MarketsState>(
            builder: (context, state) {
              return state.when(
                  loading: () => Center(child: CircularProgressIndicator()),
                  ready: (markets) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...markets.map(
                          (e) => MarketView(model: e),
                        )
                      ],
                    );
                  },
                  error: (error) => TextBody(error.toString()));
            },
          ),
        ));
  }
}
