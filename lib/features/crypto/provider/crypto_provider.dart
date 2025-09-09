import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:coin_market/app/base_change_notifier.dart';
import 'package:coin_market/app/service_locator.dart';
import 'package:coin_market/features/crypto/models/crypto_model.dart';
import 'package:coin_market/features/crypto/repository/crypto_repository.dart';

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
        onError(error.message ?? '');
      },
    );
    notifyListeners();
  }

  List<CoinMarketData> _searchedList = [];
  List<CoinMarketData> get searchedList => _searchedList;

  String _query = '';
  String get query => _query;

  void setQuery(String query) {
    _query = query;
    notifyListeners();
  }

  void setSearchedList() {
    if (_query.isEmpty) {
      _searchedList = coinMarketResponseModel.data;
      notifyListeners();
      return;
    }
    _searchedList =
        coinMarketResponseModel.data
            .where(
              (element) =>
                  element.name.toLowerCase().contains(query.toLowerCase()) ||
                  element.symbol.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
    notifyListeners();
  }
}
