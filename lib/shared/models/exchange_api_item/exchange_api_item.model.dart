import 'package:freezed_annotation/freezed_annotation.dart';

part 'exchange_api_item.model.g.dart';

part 'exchange_api_item.model.freezed.dart';

@freezed
class ExchangeApiItemModel with _$ExchangeApiItemModel {
  const factory ExchangeApiItemModel({
    required String id,
    required String name,
  }) = _ExchangeApiItemModel;

  factory ExchangeApiItemModel.fromJson(Map<String, dynamic> json) =>
      _$ExchangeApiItemModelFromJson(json);
}
