// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i4;

import '../shared/network/network.module.dart' as _i6;
import '../shared/repositories/coins/coins.repository.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.Dio>(() => networkModule.dio);
  gh.lazySingleton<Map<String, String>>(() => networkModule.headers);
  gh.lazySingleton<_i4.PrettyDioLogger>(
      () => networkModule.dioLoggingInterceptor);
  gh.factory<String>(
    () => networkModule.baseURL,
    instanceName: 'baseURL',
  );
  gh.lazySingleton<_i5.CoinsRepository>(
      () => _i5.CoinsRepository(get<_i3.Dio>()));
  return get;
}

class _$NetworkModule extends _i6.NetworkModule {}
