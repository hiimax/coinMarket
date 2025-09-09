import 'package:prodev/core/api/api_helper.dart';
import 'package:prodev/features/crypto/models/crypto_model.dart';
import 'package:prodev/features/crypto/repository/crypto_repository.dart';

class CryptoRepositoryImpl implements CryptoRepository {
  final ApiHandler _apiHandler;

  CryptoRepositoryImpl(this._apiHandler);

  @override
  Future<ApiResponse<CoinMarketResponseModel>> getCryptocurrencyList({
    required num start,
    required num limit,
  }) {
    return _apiHandler.request(
      path: 'cryptocurrency/listings/latest',
      method: MethodType.get,
      //  queryParameters: {"limit": limit, "start": start},
      responseMapper: CoinMarketResponseModel.fromJson,
    );
  }
}
