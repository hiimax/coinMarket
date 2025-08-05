import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  static AuthenticationProvider? _instance;

  AuthenticationProvider() {
    // _authRepository = locator.get<AuthRepository>();
    // _loginResponse = LoginResponse.empty();
    // _registerResponse = RegisterResponse.empty();
    // _profileResponse = ProfileResponse.empty();
    // _walletModel = WalletModel.empty();
  }

  static AuthenticationProvider get instance {
    _instance ??= AuthenticationProvider();
    return _instance!;
  }
}

class LocaleProvider extends ChangeNotifier {
  Locale? _locale;

  Locale? get locale => _locale;

  void set(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  AdaptiveThemeMode _savedThemeMode = AdaptiveThemeMode.light;

  AdaptiveThemeMode get savedThemeMode => _savedThemeMode;

  void setThemeMode(AdaptiveThemeMode themeMode) {
    _savedThemeMode = themeMode;
    notifyListeners();
  }
}
