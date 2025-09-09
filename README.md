# Coin Market - Live Cryptocurrency Tracker

A Flutter application that displays real-time cryptocurrency market data using the CoinMarketCap API with live price updates and comprehensive market analytics.

## ⚡ Quick Start (5 minutes)

```bash
# 1. Clone and setup
git clone <repository-url>
cd coin_market
flutter pub get

# 2. Configure API key
# Edit assets/env/development.env and add your CoinMarketCap API key

# 3. Generate code and run
dart run build_runner build --delete-conflicting-outputs
flutter run
```

**Need help?** Check the [detailed setup guide](#-quick-start-guide) below.

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

## 🚀 Quick Start Guide

### Prerequisites

Before running the Coin Market app, ensure you have the following installed:

- **Flutter SDK** (3.7.2 or higher) - [Download here](https://flutter.dev/docs/get-started/install)
- **Dart SDK** (comes with Flutter)
- **Android Studio** or **VS Code** with Flutter extensions
- **Git** for version control
- **CoinMarketCap API key** (free tier available)

### 📱 Platform Setup

#### For Android Development:
- Android Studio with Android SDK
- Android device or emulator
- Enable Developer Options and USB Debugging on your device

#### For iOS Development (macOS only):
- Xcode (latest version)
- iOS Simulator or physical iOS device
- Apple Developer account (for device testing)

### 🛠️ Installation & Setup

#### Step 1: Clone the Repository
```bash
git clone <repository-url>
cd coin_market
```

#### Step 2: Install Dependencies
```bash
flutter pub get
```

#### Step 3: Configure API Key
1. **Get CoinMarketCap API Key:**
   - Visit [CoinMarketCap API](https://coinmarketcap.com/api/)
   - Sign up for a free account
   - Generate your API key from the dashboard

2. **Configure the API Key:**
   - Open `assets/env/development.env`
   - Replace `YOUR_CMC_API_KEY_HERE` with your actual API key:
     ```env
     CMC_API_KEY=your_actual_api_key_here
     CMC_BASE_URL=https://pro-api.coinmarketcap.com
     ```

#### Step 4: Generate Code
```bash
dart run build_runner build --delete-conflicting-outputs
```

#### Step 5: Verify Setup
```bash
flutter doctor
```
Ensure all checks pass before proceeding.

### 🏃‍♂️ Running the Application

#### Option 1: Run on Connected Device
```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d <device-id>

# Run on default device
flutter run
```

#### Option 2: Run on Emulator/Simulator
```bash
# For Android
flutter run -d android

# For iOS (macOS only)
flutter run -d ios
```

#### Option 3: Run in Debug Mode
```bash
# Run with hot reload enabled
flutter run --debug

# Run with verbose output
flutter run -v
```

#### Option 4: Run in Release Mode
```bash
# Run optimized version
flutter run --release
```

### 🔧 Development Commands

#### Hot Reload & Hot Restart
- **Hot Reload**: Press `r` in terminal or `Ctrl+S` in VS Code
- **Hot Restart**: Press `R` in terminal or `Ctrl+Shift+S` in VS Code
- **Quit**: Press `q` in terminal

#### Build Commands
```bash
# Build APK for Android
flutter build apk

# Build APK with specific flavor
flutter build apk --flavor dev

# Build iOS app
flutter build ios

# Build for web
flutter build web
```

#### Testing Commands
```bash
# Run unit tests
flutter test

# Run integration tests
flutter test integration_test/

# Run tests with coverage
flutter test --coverage
```

### 🌍 Environment Configuration

The app supports multiple environments:

#### Development Environment
```bash
flutter run --flavor dev
```
- Uses `assets/env/development.env`
- Debug mode enabled
- Verbose logging

#### Staging Environment
```bash
flutter run --flavor staging
```
- Uses `assets/env/staging.env`
- Production-like settings
- Limited logging

#### Production Environment
```bash
flutter run --flavor prod
```
- Uses `assets/env/production.env`
- Optimized performance
- Minimal logging

### 📱 Platform-Specific Instructions

#### Android Setup
1. **Enable Developer Options:**
   - Go to Settings > About Phone
   - Tap "Build Number" 7 times
   - Go back to Settings > Developer Options
   - Enable "USB Debugging"

2. **Run on Android:**
   ```bash
   flutter run -d android
   ```

#### iOS Setup (macOS only)
1. **Open in Xcode:**
   ```bash
   open ios/Runner.xcworkspace
   ```

2. **Configure Signing:**
   - Select your development team
   - Choose bundle identifier

3. **Run on iOS:**
   ```bash
   flutter run -d ios
   ```

### 🐛 Troubleshooting

#### Common Issues & Solutions

**1. Flutter Doctor Issues:**
```bash
# Update Flutter
flutter upgrade

# Clean and get packages
flutter clean
flutter pub get
```

**2. Build Issues:**
```bash
# Clean build cache
flutter clean
rm -rf build/
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

**3. API Key Issues:**
- Verify API key is correctly set in environment file
- Check API key permissions on CoinMarketCap dashboard
- Ensure no extra spaces or quotes in the API key

**4. Device Connection Issues:**
```bash
# List devices
flutter devices

# Restart ADB (Android)
adb kill-server
adb start-server

# Check device permissions
adb devices
```

**5. iOS Simulator Issues:**
```bash
# Reset iOS Simulator
xcrun simctl erase all

# List available simulators
xcrun simctl list devices
```

### 📊 Performance Tips

#### For Better Performance:
```bash
# Run in profile mode for performance testing
flutter run --profile

# Run with specific performance flags
flutter run --enable-software-rendering
```

#### Memory Optimization:
- Use `flutter run --verbose` to monitor memory usage
- Check for memory leaks in development
- Optimize images and assets

### 🔍 Debugging

#### Debug Mode Features:
- Hot reload for instant updates
- Debug console with detailed logs
- Network request monitoring
- Performance profiling tools

#### Useful Debug Commands:
```bash
# Run with debug flags
flutter run --debug

# Run with specific debug options
flutter run --debug --verbose

# Attach debugger
flutter attach
```

### 📦 Building for Distribution

#### Android APK:
```bash
# Build release APK
flutter build apk --release

# Build app bundle (recommended for Play Store)
flutter build appbundle --release
```

#### iOS App:
```bash
# Build for iOS
flutter build ios --release

# Archive for App Store
# Use Xcode: Product > Archive
```

### 🚀 Deployment Checklist

Before deploying:
- [ ] API keys configured correctly
- [ ] All tests passing
- [ ] App builds without errors
- [ ] Performance tested
- [ ] UI tested on different screen sizes
- [ ] Network error handling verified

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