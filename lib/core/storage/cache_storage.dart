import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  late final SharedPreferences _sharedPrefs;

  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }

  void clearAll() {
    _sharedPrefs.clear();
  }

  bool get firstTime => _sharedPrefs.getBool('firstTime') ?? true;

  set firstTime(bool value) {
    _sharedPrefs.setBool('firstTime', value);
  }

  bool get rememberMe => _sharedPrefs.getBool('rememberMe') ?? true;

  set rememberMe(bool value) {
    _sharedPrefs.setBool('rememberMe', value);
  }

  String? get accessToken => _sharedPrefs.getString('accessToken');

  set accessToken(String? value) {
    _sharedPrefs.setString('accessToken', value ?? '');
  }

  String? get firstName => _sharedPrefs.getString('firstName');

  set firstName(String? value) {
    _sharedPrefs.setString('firstName', value ?? '');
  }

  String? get deviceId => _sharedPrefs.getString('deviceId');

  set deviceId(String? value) {
    _sharedPrefs.setString('deviceId', value ?? '');
  }

  String? get email => _sharedPrefs.getString('email');

  set email(String? value) {
    _sharedPrefs.setString('email', value ?? '');
  }

  String? get password => _sharedPrefs.getString('password');

  set password(String? value) {
    _sharedPrefs.setString('password', value ?? '');
  }

  bool get activityNotification =>
      _sharedPrefs.getBool('activityNotification') ?? true;

  set activityNotification(bool value) {
    _sharedPrefs.setBool('activityNotification', value);
  }

  bool get emailNotification =>
      _sharedPrefs.getBool('emailNotification') ?? true;

  set emailNotification(bool value) {
    _sharedPrefs.setBool('emailNotification', value);
  }

  bool get faceVerification =>
      _sharedPrefs.getBool('faceVerification') ?? false;

  set faceVerification(bool value) {
    _sharedPrefs.setBool('faceVerification', value);
  }

  bool get fingerprintVerification =>
      _sharedPrefs.getBool('fingerprintVerification') ?? false;

  set fingerprintVerification(bool value) {
    _sharedPrefs.setBool('fingerprintVerification', value);
  }

  bool get biometricVerification =>
      _sharedPrefs.getBool('biometricVerification') ?? false;

  set biometricVerification(bool value) {
    _sharedPrefs.setBool('biometricVerification', value);
  }

  bool get hideBalance => _sharedPrefs.getBool('hideBalance') ?? false;

  set hideBalance(bool value) {
    _sharedPrefs.setBool('hideBalance', value);
  }

 

  List<String> get productSearchList =>
      _sharedPrefs.getStringList('productSearchKey') ?? [];

  set productSearchList(List<String> value) {
    _sharedPrefs.setStringList('productSearchKey', value);
  }

  void clearStorage(String key) {
    _sharedPrefs.remove(key);
  }

  void clearCart() {
    _sharedPrefs.remove('cartItem');
  }
}
