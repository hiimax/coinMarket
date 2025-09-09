import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:coin_market/app/app.dart';
import 'package:coin_market/app/bootstrap.dart';
import 'package:coin_market/env/env.dart';

void main() async {
  // await setupLocator(environment: AppEnvironment.dev);
  unawaited(
    bootstrap(
      () => ProviderScope(child: const ProDevApp()),
      environment: AppEnvironment.staging,
    ),
  );
}

