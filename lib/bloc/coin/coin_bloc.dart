import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:crypto_watcher/di/injector.dart';
import 'package:crypto_watcher/shared/models/model.dart';
import 'package:crypto_watcher/shared/repositories/coins/coins.repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'coin_event.dart';

part 'coin_state.dart';

part 'coin_bloc.freezed.dart';

abstract class CoinBloc extends Bloc<CoinEvent, CoinState> {
  CoinBloc(super.initialState);
}

class CoinBlocImpl extends CoinBloc {
  final CoinsRepository _repository;

  CoinBlocImpl()
      : _repository = getIt<CoinsRepository>(),
        super(CoinState.loading()) {
    on<CoinEvent_OnGetMarketCoin>(_onGetMarketCoin);
  }

  FutureOr<void> _onGetMarketCoin(
      CoinEvent_OnGetMarketCoin event, Emitter<CoinState> emit) {

  }
}
