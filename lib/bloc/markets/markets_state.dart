part of 'markets_bloc.dart';

@freezed
class MarketsState with _$MarketsState {
  const factory MarketsState.loading() = MarketsState_loading;

  const factory MarketsState.ready({
    required Iterable<MarketModel> markets,
  }) = MarketsState_Ready;

  const factory MarketsState.error({
    Object? error,
  }) = MarketsState_Error;
}
