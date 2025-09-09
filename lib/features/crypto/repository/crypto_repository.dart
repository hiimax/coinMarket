import 'package:prodev/core/api/api_helper.dart';
import 'package:prodev/features/crypto/models/crypto_model.dart';

abstract class CryptoRepository {
  Future<ApiResponse<CoinMarketResponseModel>> getCryptocurrencyList({
    required num start,
    required num limit,
  });

  // Future<ApiResponse<CryptoDetailResponse>> getCryptocurrencyDetail({
  //   required String id,
  //   String? aux,
  // });
}
