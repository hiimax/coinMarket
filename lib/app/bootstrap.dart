import 'dart:async';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:coin_market/app/service_locator.dart';
import 'package:coin_market/core/storage/cache_storage.dart';
import 'package:coin_market/env/env.dart';
import 'package:coin_market/firebase_options.dart';

Future<void> bootstrap(
  FutureOr<Widget> Function() builder, {
  required AppEnvironment environment,
}) async {
  try {
    await WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (details) {
      log(
        details.exceptionAsString(),
        stackTrace: details.stack,
        name: details.exception.runtimeType.toString(),
      );
    };

    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );
    await setupLocator(environment: environment);
    await locator.get<SharedPrefs>().init();

    // setLocaleMessages('en', MyCustomMessages());
    runApp(await builder());
  } catch (e) {
    log(e.toString(), name: 'bootstrap');
    // await FirebaseCrashlytics.instance.recordError(e, s, fatal: true);
  }
}
