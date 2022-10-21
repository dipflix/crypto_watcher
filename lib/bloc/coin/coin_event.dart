part of 'coin_bloc.dart';

@immutable
@freezed
class CoinEvent with _$CoinEvent {

  const factory CoinEvent.getMarketCoins(int id) = CoinEvent_OnGetCoin;
}
