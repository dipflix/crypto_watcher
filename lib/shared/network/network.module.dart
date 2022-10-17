import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  PrettyDioLogger get dioLoggingInterceptor => PrettyDioLogger(
    requestHeader: false,
    requestBody: false,
    responseBody: false,
    responseHeader: false,
    error: true,
    compact: true,
  );

  @lazySingleton
  Map<String, String> get headers => {
    'accept': 'application/json',
  };

  @lazySingleton
  @injectable
  Dio get dio => Dio()
    ..interceptors.add(dioLoggingInterceptor)
    ..options.receiveDataWhenStatusError = true
    ..options.headers = headers
    ..options.baseUrl = baseURL;

  @Named("baseURL")
  @injectable
  String get baseURL => dotenv.get('API_BASE_URL');

}