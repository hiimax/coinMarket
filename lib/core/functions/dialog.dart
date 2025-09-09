import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coin_market/app/router.dart';

class TransDialog implements AbstractTransDialog {
  TransDialog._();
  static final TransDialog instance = TransDialog._();

  factory TransDialog() {
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

abstract class AbstractTransDialog {
  Future<T?> openDialog<T>({
    BuildContext? context,
    required Widget dialogContent,
    double? borderRadius,
    EdgeInsetsGeometry? contentPadding,
    Color? backgroundColor,
    bool barrierDismissible = true,
  });
}
