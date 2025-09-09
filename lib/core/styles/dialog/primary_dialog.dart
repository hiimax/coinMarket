import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prodev/app/router.dart';
import 'package:prodev/core/utils/import.dart';

abstract class AbstractCoinMarketDialog {
  Future<T?> openDialog<T>({
    BuildContext? context,
    required Widget dialogContent,
    double? borderRadius,
    EdgeInsetsGeometry? contentPadding,
    Color? backgroundColor,
    bool barrierDismissible = true,
  });
}

class CoinMarketDialog implements AbstractCoinMarketDialog {
  CoinMarketDialog._();
  static final CoinMarketDialog instance = CoinMarketDialog._();

  factory CoinMarketDialog() {
    return instance;
  }

  @override
  Future<T?> openDialog<T>({
    BuildContext? context,
    required Widget dialogContent,
    double? borderRadius,
    EdgeInsetsGeometry? contentPadding,
    Color? backgroundColor,
    bool barrierDismissible = true,
  }) async {
    return showDialog<T>(
      context: context ?? rootNavigatorKey.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return SimpleDialog(
          backgroundColor: backgroundColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.0.r),
          ),
          contentPadding: contentPadding ?? EdgeInsets.all(24.r),
          children: [dialogContent],
        );
      },
    );
  }
}
