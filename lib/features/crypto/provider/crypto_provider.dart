import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prodev/app/base_change_notifier.dart';
import 'package:prodev/app/service_locator.dart';
import 'package:prodev/features/crypto/models/crypto_model.dart';
import 'package:prodev/features/crypto/repository/crypto_repository.dart';

final cryptoNotifierProvider = ChangeNotifierProvider<CryptoProvider>((ref) {
  return CryptoProvider(locator.get<CryptoRepository>());
});

class CryptoProvider extends BaseChangeNotifier {
  final CryptoRepository _cryptoRepository;
  CryptoProvider(this._cryptoRepository);

  CoinMarketResponseModel _coinMarketResponseModel =
      CoinMarketResponseModel.empty();
  CoinMarketResponseModel get coinMarketResponseModel =>
      _coinMarketResponseModel;

  Future<void> getCryptocurrencyList({
    required Function(String val) onSuccess,
    required Function(String val) onError,
  }) async {
    final response = await _cryptoRepository.getCryptocurrencyList(
      start: 1,
      limit: 100,
    );
    response.when(
      success: (data) async {
        if (data != null) {
          _coinMarketResponseModel =
              data.data ?? CoinMarketResponseModel.empty();
          onSuccess(data.message ?? '');
        }
      },
      error: (error) {
        _coinMarketResponseModel = CoinMarketResponseModel.empty();
        onError(error.message ?? '');
      },
    );
    notifyListeners();
  }
}
