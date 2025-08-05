import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:prodev/app/service_locator.dart';
import 'package:prodev/core/storage/cache_storage.dart';
import 'package:prodev/env/env.dart';
import 'package:prodev/firebase_options.dart';

final notificationPlugin = FlutterLocalNotificationsPlugin();
const initializationSettings = InitializationSettings(
  android: AndroidInitializationSettings('@mipmap/ic_launcher'),
  iOS: DarwinInitializationSettings(
    requestProvisionalPermission: true,
    requestCriticalPermission: true,
  ),
);


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

    await notificationPlugin.initialize(initializationSettings);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await setupLocator(environment: environment);
    await locator.get<SharedPrefs>().init();
   
    

    
    // setLocaleMessages('en', MyCustomMessages());
    runApp(await builder());
  } catch (e) {
    log(e.toString(), name: 'bootstrap');
    // await FirebaseCrashlytics.instance.recordError(e, s, fatal: true);
  }
}
