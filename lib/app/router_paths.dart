import 'package:go_router_paths/go_router_paths.dart';

class AppPath {
  static final splash = SplashPath();
  static final auth = AuthPath();
  static final crypto = CryptoPath();
}

class SplashPath extends Path<SplashPath> {
  SplashPath() : super('/');

  Path get welcomeScreen => Path('welcome-screen', parent: this);
}

class AuthPath extends Path<AuthPath> {
  AuthPath() : super('/auth');
}

class CryptoPath extends Path<CryptoPath> {
  CryptoPath() : super('/crypto');

  Path get list => Path('list', parent: this);
  Path get detail => Path('detail', parent: this);
}
