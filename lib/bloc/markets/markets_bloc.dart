import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crypto_watcher/di/injector.dart';
import 'package:crypto_watcher/shared/models/market/market.model.dart';
import 'package:crypto_watcher/shared/shared.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'markets_bloc.freezed.dart';

part 'markets_event.dart';

part 'markets_state.dart';

class MarketsBloc extends Bloc<MarketsEvent, MarketsState> {
  final CoinsRepository _repository;

  MarketsBloc()
      : _repository = getIt<CoinsRepository>(),
        super(MarketsState.loading()) {
    on<MarketsEvent_OnGetMarketCoin>(_getMarketCoins);
  }

  FutureOr<void> _getMarketCoins(
    MarketsEvent_OnGetMarketCoin event,
    Emitter<MarketsState> emit,
  ) async {
    emit(MarketsState.loading());

    try {
      var response = await _repository.getMarkets(
        vsCurrency: event.currency,
        order: event.order,
        page: event.pageNumber,
        perPage: event.perPage,
        sparkline: event.sparkline,
      );

      print(response.first);

      emit(MarketsState.ready(markets: response));
    } on DioError catch (e) {
      emit(MarketsState.error(error: e));
    }
  }
}
