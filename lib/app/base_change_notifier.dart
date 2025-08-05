
import 'package:flutter/foundation.dart';
import 'package:prodev/app/router.dart';
import 'package:prodev/core/utils/toast_util.dart';


class BaseChangeNotifier extends ChangeNotifier {
  BaseChangeNotifier() {}

  bool _loading = false;

  bool get loading => _loading;

  void setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  void log(Object? e) {
    if (kDebugMode) log(e.toString());
  }

  void handleError({String? message, Object? error}) {
    setLoading(false);
    rootNavigatorKey.currentContext!.showErrorMessage(
      message: message ?? '',
    );
  }
}
