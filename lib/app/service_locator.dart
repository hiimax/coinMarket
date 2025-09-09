import 'package:get_it/get_it.dart';
import 'package:prodev/core/api/api_helper.dart';
import 'package:prodev/core/storage/cache_storage.dart';
import 'package:prodev/env/env.dart';
import 'package:prodev/features/crypto/repository/crypto_repository.dart';
import 'package:prodev/features/crypto/repository/crypto_repository_impl.dart';

// import 'package:twilio_flutter/twilio_flutter.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator({required AppEnvironment environment}) async {
  locator
    ..registerLazySingleton<AppEnvironment>(() => environment)
    ..registerLazySingleton<SharedPrefs>(SharedPrefs.new)
    ..registerLazySingleton<ApiHandler>(
      () => ApiHandler(baseUrl: Env().baseUrl),
    )
    ..registerLazySingleton<CryptoRepository>(
      () => CryptoRepositoryImpl(locator.get<ApiHandler>()),
    );
  // ..registerLazySingleton<GiftRepository>(
  //   () => GiftRepositoryImpl(locator.get<ApiHandler>()),
  // )
  // ..registerLazySingleton<ShopRepository>(
  //   () => ShopRepositoryImpl(locator.get<ApiHandler>()),
  // )
  // ..registerLazySingleton<HomeRepository>(
  //   () => HomeRepositoryImpl(locator.get<ApiHandler>()),
  // )
  // ..registerLazySingleton<VirtualCardRepository>(
  //   () => VirtualCardRepositoryImpl(locator.get<ApiHandler>()),
  // )
  // ..registerLazySingleton<VendorRepository>(
  //   () => VendorRepositoryImpl(locator.get<ApiHandler>()),
  // );
}

// extension GetItExtensions on GetIt {
//   void setApiHandlerToken(String token) {
//     // for (final element in ApiService.values) {
//     get<ApiHandler>(
//       // instanceName: element.name,
//     ).addToken(token);
//     // }
//   }

//   void clearApiHandlerToken() {
//     // for (final element in ApiService.values) {
//     get<ApiHandler>(
//       // instanceName: element.name,
//     ).clearToken();
//     // }
//   }
// }
