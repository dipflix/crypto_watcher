part of 'markets_bloc.dart';

@freezed
class MarketsEvent with _$MarketsEvent {
  const factory MarketsEvent.getMarketCoins({
    required String currency,
    String? order,
    int? pageNumber,
    int? perPage,
    bool? sparkline,
  }) = MarketsEvent_OnGetMarketCoin;
}
