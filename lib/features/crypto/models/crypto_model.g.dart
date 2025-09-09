// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinMarketResponseModel _$CoinMarketResponseModelFromJson(
        Map<String, dynamic> json) =>
    CoinMarketResponseModel(
      status: CoinMarketStatus.fromJson(json['status'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => CoinMarketData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
