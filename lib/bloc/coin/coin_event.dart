part of 'coin_bloc.dart';

@immutable
@freezed
class CoinEvent with _$CoinEvent {

  const factory CoinEvent.getMarketCoins(String currency, String order,
      int pageNumber, int perPage, String sparkline) = CoinEvent_OnGetMarketCoin;
}
