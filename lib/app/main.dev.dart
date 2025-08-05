import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prodev/app/app.dart';
import 'package:prodev/app/bootstrap.dart';
import 'package:prodev/env/env.dart';
import 'package:prodev/features/auth/screens/challenge.dart';

void main() async {
  // await setupLocator(environment: AppEnvironment.dev);
  unawaited(
    bootstrap(
      () => ProviderScope(child: const ProDevApp()),
      environment: AppEnvironment.dev,
    ),
  );
}
