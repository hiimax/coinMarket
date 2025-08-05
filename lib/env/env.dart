import 'package:prodev/app/service_locator.dart';
import 'package:prodev/env/development.dart';
import 'package:prodev/env/env_fields.dart';
import 'package:prodev/env/production.dart';
import 'package:prodev/env/staging.dart';

enum AppEnvironment { dev, staging, prod }

abstract interface class Env implements EnvFields {
  factory Env() => _instance;

  static final Env _instance = switch (locator<AppEnvironment>()) {
    AppEnvironment.dev => DevEnv(),
    AppEnvironment.staging => QaEnv(),
    AppEnvironment.prod => ProdEnv(),
  };
}
