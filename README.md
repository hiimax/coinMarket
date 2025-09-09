# Coin Market - Live Cryptocurrency Tracker

A Flutter application that displays real-time cryptocurrency market data using the CoinMarketCap API with live price updates and comprehensive market analytics.

## Features

- **Cryptocurrency List**: Display a list of cryptocurrencies with current prices and 24-hour price changes
- **Pull-to-Refresh**: Refresh cryptocurrency data by pulling down on the list
- **Real-time Updates**: Live price updates using WebSocket integration (Binance WebSocket API)
- **Detailed View**: Individual cryptocurrency detail screen with comprehensive information
- **Error Handling**: Graceful error handling for network issues and API downtime
- **Clean Architecture**: Follows provider/riverpod structure, API call structure, and routing structure

## Tech Stack

- **Flutter**: Cross-platform mobile development framework
- **Riverpod**: State management solution
- **Dio**: HTTP client for API calls
- **Go Router**: Declarative routing solution
- **Freezed**: Code generation for data classes
- **WebSocket**: Real-time data streaming
- **CoinMarketCap API**: Cryptocurrency data source
- **Binance WebSocket API**: Real-time price updates

## Project Structure

```
lib/
├── app/
│   ├── router.dart              # App routing configuration
│   ├── router_paths.dart        # Route path definitions
│   └── service_locator.dart     # Dependency injection setup
├── core/
│   ├── api/
│   │   └── api_helper.dart      # HTTP client and API utilities
│   ├── error/
│   │   └── error_handler.dart   # Error handling utilities
│   └── widgets/
│       └── app_loading_widget.dart # Loading widgets
├── features/
│   └── crypto/
│       ├── models/
│       │   └── crypto_model.dart    # Data models
│       ├── provider/
│       │   ├── crypto_provider.dart # State management
│       │   └── websocket_provider.dart # WebSocket state
│       ├── repository/
│       │   ├── crypto_repository.dart # Repository interface
│       │   └── crypto_repository_impl.dart # Repository implementation
│       ├── screens/
│       │   ├── crypto_list_screen.dart # Cryptocurrency list
│       │   └── crypto_detail_screen.dart # Cryptocurrency details
│       ├── services/
│       │   ├── mock_crypto_service.dart # Mock data service
│       │   └── websocket_service.dart # WebSocket service
│       └── widgets/
│           ├── crypto_list_item.dart # List item widget
│           ├── price_chart_widget.dart # Price chart widget
│           └── price_info_card.dart # Price info card widget
└── env/
    ├── env.dart                 # Environment configuration
    ├── env_fields.dart          # Environment field definitions
    └── development.dart         # Development environment
```

## Setup Instructions

### Prerequisites

- Flutter SDK (3.7.2 or higher)
- Dart SDK
- Android Studio / VS Code
- CoinMarketCap API key (free tier available)

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd coin_market
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure API Key**
   - Get your free CoinMarketCap API key from [https://coinmarketcap.com/api/](https://coinmarketcap.com/api/)
   - Open `assets/env/development.env`
   - Replace `YOUR_CMC_API_KEY_HERE` with your actual API key:
     ```
     CMC_API_KEY=your_actual_api_key_here
     ```

4. **Generate code**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **Run the application**
   ```bash
   flutter run
   ```

## API Configuration

### CoinMarketCap API

The app uses the CoinMarketCap API for cryptocurrency data:

- **Base URL**: `https://pro-api.coinmarketcap.com`
- **Endpoints**:
  - `/v1/cryptocurrency/listings/latest` - Get latest cryptocurrency listings
  - `/v1/cryptocurrency/quotes/latest` - Get cryptocurrency quotes

### WebSocket Integration

Real-time price updates are provided via Binance WebSocket API:

- **WebSocket URL**: `wss://stream.binance.com:9443/ws/{symbol}@ticker`
- **Supported Symbols**: BTC, ETH, BNB, ADA, SOL, XRP, DOT, DOGE, AVAX, LINK, and more

## Key Features Implementation

### 1. Cryptocurrency List with Pull-to-Refresh

```dart
RefreshIndicator(
  onRefresh: () async {
    refreshKey.value++;
    ref.invalidate(cryptoListProvider(defaultCryptoListParams));
  },
  child: FutureBuilder<List<CryptoModel>>(
    // ... list implementation
  ),
)
```

### 2. Real-time Price Updates

```dart
final webSocketStream = ref.watch(webSocketStreamProvider(cryptoSymbol));

webSocketStream.when(
  data: (data) => _buildRealTimePriceCard(crypto, data),
  loading: () => _buildStaticPriceCard(crypto),
  error: (_, __) => _buildStaticPriceCard(crypto),
)
```

### 3. Error Handling

The app includes comprehensive error handling:

- Network connectivity issues
- API rate limiting
- WebSocket connection failures
- Data parsing errors
- Graceful fallbacks to static data

### 4. State Management with Riverpod

```dart
// Repository provider
final cryptoRepositoryProvider = Provider<CryptoRepository>((ref) {
  final env = Env();
  final apiHandler = ApiHandler(baseUrl: env.cmcBaseUrl);
  apiHandler.addCustomHeader('X-CMC_PRO_API_KEY', env.cmcApiKey);
  return CryptoRepositoryImpl(apiHandler);
});

// Crypto list provider
final cryptoListProvider = FutureProvider.family<List<CryptoModel>, CryptoListParams>(
  (ref, params) async {
    final repository = ref.read(cryptoRepositoryProvider);
    // ... implementation
  },
);
```

## Environment Configuration

The app supports multiple environments:

- **Development**: `assets/env/development.env`
- **Staging**: `assets/env/staging.env`
- **Production**: `assets/env/production.env`

Each environment file contains:
- API keys and secrets
- Base URLs
- Feature flags
- Other configuration values

## Running Different Environments

```bash
# Development
flutter run --flavor dev

# Staging
flutter run --flavor staging

# Production
flutter run --flavor prod
```

## Testing

```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/
```

## Building for Release

```bash
# Android
flutter build apk --release

# iOS
flutter build ios --release
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## API Rate Limits

- CoinMarketCap API has rate limits based on your plan
- Free tier: 10,000 calls per month
- The app implements proper error handling for rate limit exceeded scenarios

## Troubleshooting

### Common Issues

1. **API Key Issues**
   - Ensure your CoinMarketCap API key is valid
   - Check that the key is properly set in the environment file

2. **WebSocket Connection Issues**
   - Verify internet connectivity
   - Check if Binance WebSocket is accessible from your network

3. **Build Issues**
   - Run `flutter clean` and `flutter pub get`
   - Ensure all code generation is up to date with `dart run build_runner build`

4. **Linting Errors**
   - Run `dart run build_runner build --delete-conflicting-outputs`
   - Check for any missing imports or dependencies

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

For questions or support, please contact the development team.

---

**Note**: This application is built as part of a technical interview task and demonstrates proficiency in Flutter development, state management with Riverpod, API integration, and real-time data handling.