import 'package:coin_market/app/service_locator.dart';
import 'package:coin_market/env/development.dart';
import 'package:coin_market/env/env_fields.dart';
import 'package:coin_market/env/production.dart';
import 'package:coin_market/env/staging.dart';

enum AppEnvironment { dev, staging, prod }

abstract interface class Env implements EnvFields {
  factory Env() => _instance;

  static final Env _instance = switch (locator<AppEnvironment>()) {
    AppEnvironment.dev => DevEnv(),
    AppEnvironment.staging => QaEnv(),
    AppEnvironment.prod => ProdEnv(),
  };
}
