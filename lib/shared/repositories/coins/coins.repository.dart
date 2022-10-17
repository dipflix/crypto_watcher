import 'package:crypto_watcher/shared/models/model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'coins.repository.g.dart';

@LazySingleton()
@RestApi()
abstract class CoinsRepository {
  @factoryMethod
  factory CoinsRepository(Dio dio) = _CoinsRepository;

  @GET('coins/list')
  Future<List<CoinModel>> getList({
    @Query('include_platform') bool? includePlatform,
  });

  ///Get current data (name, price, market, ... including exchange tickers) for a coin.
  @GET('coins/{id}')
  Future<CoinFullModel> getCoin({
    // pass the coin id (can be obtained from /coins) eg. bitcoin
    @Path('id') required String id,
    // Include all localized languages in response (true/false) [default: true]
    @Query('localization') bool? localization,
    // Include tickers data (true/false) [default: true]
    @Query('tickers') bool? tickers,
    // Include market_data (true/false) [default: true]
    @Query('market_data') bool? marketData,
    // Include community_data data (true/false) [default: true]
    @Query('community_data') bool? communityData,
    // Include developer_data data (true/false) [default: true]
    @Query('developer_data') bool? developerData,
    // Include sparkline 7 days data (eg. true, false) [default: false]
    @Query('sparkline') bool? sparkline,
  });

  @GET('coins/markets')
  Future<List<MarketModel>> getMarkets({
    // The target currency of market data (usd, eur, jpy, etc.)
    @Query('vs_currency') required String vsCurrency,
    @Query('ids') List<String>? ids,
    @Query('category') String? category,

    // Valid values: market_cap_desc, gecko_desc, gecko_asc, market_cap_asc, market_cap_desc, volume_asc, volume_desc, id_asc, id_desc
    // Default value : market_cap_desc
    @Query('order') String? order,

    // Valid values: 1..250
    @Query('per_page') int? perPage,
    @Query('page') int? page,

    // Include sparkline 7 days data (eg. true, false)
    // Default value : false
    @Query('sparkline') bool? sparkline,

    /// Include price change percentage in 1h, 24h, 7d, 14d, 30d, 200d, 1y (eg. '1h,24h,7d' comma-separated, invalid values will be discarded)
    @Query('price_change_percentage') String? priceChangePercentage,
  });
}
