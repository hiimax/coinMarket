import 'package:freezed_annotation/freezed_annotation.dart';

part 'crypto_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class CoinMarketResponseModel {
  final CoinMarketStatus status;
  final List<CoinMarketData> data;

  CoinMarketResponseModel({required this.status, required this.data});

  /// **Custom factory method to handle dynamic values**
  factory CoinMarketResponseModel.fromJson(Map<String, dynamic> json) =>
      CoinMarketResponseModel(
        status:
            json['status'] != null
                ? CoinMarketStatus.fromJson(json['status'])
                : CoinMarketStatus.empty(),
        data:
            json['data'] != null && json['data'] != []
                ? List<CoinMarketData>.from(
                  json['data'].map((v) => CoinMarketData.fromJson(v)),
                )
                : <CoinMarketData>[],
      );

  factory CoinMarketResponseModel.empty() => CoinMarketResponseModel(
    status: CoinMarketStatus.empty(),
    data: <CoinMarketData>[],
  );
}

class CoinMarketStatus {
  final String timestamp;
  final num errorCode;
  final dynamic errorMessage;
  final num elapsed;
  final num creditCount;
  final dynamic notice;
  final num totalCount;

  CoinMarketStatus({
    required this.timestamp,
    required this.errorCode,
    required this.errorMessage,
    required this.elapsed,
    required this.creditCount,
    required this.notice,
    required this.totalCount,
  });

  /// **Custom factory method to handle dynamic values**
  factory CoinMarketStatus.fromJson(Map<String, dynamic> json) =>
      CoinMarketStatus(
        timestamp: json['timestamp'] ?? '',
        errorCode: json['error_code'] ?? 0,
        errorMessage: json['error_message'] ?? '',
        elapsed: json['elapsed'] ?? 0,
        creditCount: json['credit_count'] ?? 0,
        notice: json['notice'] ?? '',
        totalCount: json['total_count'] ?? 0,
      );

  factory CoinMarketStatus.empty() => CoinMarketStatus(
    timestamp: '',
    errorCode: 0,
    errorMessage: '',
    elapsed: 0,
    creditCount: 0,
    notice: '',
    totalCount: 0,
  );
}

class CoinMarketData {
  final num id;
  final String name;
  final String symbol;
  final String slug;
  final num numMarketPairs;
  final String dateAdded;
  final List<String> tags;
  final num maxSupply;
  final num circulatingSupply;
  final num totalSupply;
  final bool infiniteSupply;
  final Platform platform;
  final num cmcRank;
  final num selfReportedCirculatingSupply;
  final num selfReportedMarketCap;
  final num tvlRatio;
  final String lastUpdated;
  final Quote quote;

  CoinMarketData({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.numMarketPairs,
    required this.dateAdded,
    required this.tags,
    required this.maxSupply,
    required this.circulatingSupply,
    required this.totalSupply,
    required this.infiniteSupply,
    required this.platform,
    required this.cmcRank,
    required this.selfReportedCirculatingSupply,
    required this.selfReportedMarketCap,
    required this.tvlRatio,
    required this.lastUpdated,
    required this.quote,
  });

  /// **Custom factory method to handle dynamic values**
  factory CoinMarketData.fromJson(Map<String, dynamic> json) => CoinMarketData(
    id: json['id'] ?? 0,
    name: json['name'] ?? '',
    symbol: json['symbol'] ?? '',
    slug: json['slug'] ?? '',
    numMarketPairs: json['num_market_pairs'] ?? 0,
    dateAdded: json['date_added'] ?? '',
    tags:
        json['tags'] != null && json['tags'] != []
            ? List<String>.from(json['tags'].map((v) => v.toString()))
            : <String>[],
    maxSupply: json['max_supply'] ?? 0,
    circulatingSupply: json['circulating_supply'] ?? 0,
    totalSupply: json['total_supply'] ?? 0,
    infiniteSupply: json['infinite_supply'] ?? false,
    platform:
        json['platform'] != null
            ? Platform.fromJson(json['platform'])
            : Platform.empty(),
    cmcRank: json['cmc_rank'] ?? 0,
    selfReportedCirculatingSupply:
        json['self_reported_circulating_supply'] ?? 0,
    selfReportedMarketCap: json['self_reported_market_cap'] ?? 0,
    tvlRatio: json['tvl_ratio'] ?? 0,
    lastUpdated: json['last_updated'] ?? '',
    quote:
        json['quote'] != null ? Quote.fromJson(json['quote']) : Quote.empty(),
  );

  factory CoinMarketData.empty() => CoinMarketData(
    id: 0,
    name: '',
    symbol: '',
    slug: '',
    numMarketPairs: 0,
    dateAdded: '',
    tags: <String>[],
    maxSupply: 0,
    circulatingSupply: 0,
    totalSupply: 0,
    infiniteSupply: false,
    platform: Platform.empty(),
    cmcRank: 0,
    selfReportedCirculatingSupply: 0,
    selfReportedMarketCap: 0,
    tvlRatio: 0,
    lastUpdated: '',
    quote: Quote.empty(),
  );
}

class Platform {
  final num id;
  final String name;
  final String symbol;
  final String slug;
  final String tokenAddress;

  Platform({
    required this.id,
    required this.name,
    required this.symbol,
    required this.slug,
    required this.tokenAddress,
  });

  /// **Custom factory method to handle dynamic values**
  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
    id: json['id'] ?? 0,
    name: json['name'] ?? '',
    symbol: json['symbol'] ?? '',
    slug: json['slug'] ?? '',
    tokenAddress: json['token_address'] ?? '',
  );

  factory Platform.empty() =>
      Platform(id: 0, name: '', symbol: '', slug: '', tokenAddress: '');
}

class Quote {
  final USD uSD;

  Quote({required this.uSD});

  /// **Custom factory method to handle dynamic values**
  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    uSD: json['USD'] != null ? new USD.fromJson(json['USD']) : USD.empty(),
  );

  factory Quote.empty() => Quote(uSD: USD.empty());
}

class USD {
  final num price;
  final num volume24h;
  final num volumeChange24h;
  final num percentChange1h;
  final num percentChange24h;
  final num percentChange7d;
  final num percentChange30d;
  final num percentChange60d;
  final num percentChange90d;
  final num marketCap;
  final num marketCapDominance;
  final num fullyDilutedMarketCap;
  final num tvl;
  final String lastUpdated;

  USD({
    required this.price,
    required this.volume24h,
    required this.volumeChange24h,
    required this.percentChange1h,
    required this.percentChange24h,
    required this.percentChange7d,
    required this.percentChange30d,
    required this.percentChange60d,
    required this.percentChange90d,
    required this.marketCap,
    required this.marketCapDominance,
    required this.fullyDilutedMarketCap,
    required this.tvl,
    required this.lastUpdated,
  });

  /// **Custom factory method to handle dynamic values**
  factory USD.fromJson(Map<String, dynamic> json) => USD(
    price: json['price'] ?? 0,
    volume24h: json['volume_24h'] ?? 0,
    volumeChange24h: json['volume_change_24h'] ?? 0,
    percentChange1h: json['percent_change_1h'] ?? 0,
    percentChange24h: json['percent_change_24h'] ?? 0,
    percentChange7d: json['percent_change_7d'] ?? 0,
    percentChange30d: json['percent_change_30d'] ?? 0,
    percentChange60d: json['percent_change_60d'] ?? 0,
    percentChange90d: json['percent_change_90d'] ?? 0,
    marketCap: json['market_cap'] ?? 0,
    marketCapDominance: json['market_cap_dominance'] ?? 0,
    fullyDilutedMarketCap: json['fully_diluted_market_cap'] ?? 0,
    tvl: json['tvl'] ?? 0,
    lastUpdated: json['last_updated'] ?? '',
  );

  factory USD.empty() => USD(
    price: 0,
    volume24h: 0,
    volumeChange24h: 0,
    percentChange1h: 0,
    percentChange24h: 0,
    percentChange7d: 0,
    percentChange30d: 0,
    percentChange60d: 0,
    percentChange90d: 0,
    marketCap: 0,
    marketCapDominance: 0,
    fullyDilutedMarketCap: 0,
    tvl: 0,
    lastUpdated: '',
  );
}
