import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prodev/app/base_change_notifier.dart';
import 'package:prodev/app/service_locator.dart';
import 'package:prodev/features/home/models/new_response_model.dart';
import 'package:prodev/features/home/repository/auth_repository.dart';

final authNotifierProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider(locator.get<HomeRepository>());
});

class AuthProvider extends BaseChangeNotifier {
  final HomeRepository _homeRepository;
  AuthProvider(this._homeRepository);

  NewReleaseResponse _newReleaseResponse = NewReleaseResponse.empty();
  NewReleaseResponse get newReleaseResponse => _newReleaseResponse;
  Future<void> getRecentlyPlayed({
    required Function(String val) onSuccess,
    required Function(String val) onError,
  }) async {
    final response = await _homeRepository.getRecentlyPlayed();
    response.when(
      success: (data) async {
        if (data != null) {
          _newReleaseResponse = data.data ?? NewReleaseResponse.empty();

          onSuccess('');
        }
      },
      error: (error) {
        onError(error.message ?? '');
      },
    );
    notifyListeners();
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
