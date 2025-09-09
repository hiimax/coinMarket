import 'package:coin_market/features/auth/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
  ChangeNotifierProvider(create: (_) => LocaleProvider()),

  // ChangeNotifierProvider(create: (_) => ShopProvider()),
  // ChangeNotifierProvider(create: (_) => HomeProvider()),
  // ChangeNotifierProvider(create: (_) => VirtualCardProvider()),
  // ChangeNotifierProvider(create: (_) => VendorProvider()),
  // ChangeNotifierProvider(create: (_) => GiftCardProvider()),
  ...uiConsumableProviders,
];

List<SingleChildWidget> independentServices = [];

List<SingleChildWidget> dependentServices = [];

// Place All ChangeNotifierProvider's separated by a comma ","

List<SingleChildWidget> uiConsumableProviders = [];
