part of 'coin_bloc.dart';

@freezed
class CoinState with _$CoinState {
  const factory CoinState.loading() = CoinState_loading;

  const factory CoinState.ready({
    required Iterable<CoinModel> coins,
  }) = CoinState_Ready;

  const factory CoinState.error({
    Object? error,
  }) = CoinState_Error;
}
