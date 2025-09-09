import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:coin_market/core/utils/spacer.dart';
import 'package:coin_market/resources/colors.dart';

const kFlushBarDuration = 4;

extension ToastUtil on BuildContext {
  void showErrorMessage({String? message}) {
    _flushbar(
      context: this,
      message: message ?? 'An error occurred',
      icon: Icons.info_outline_rounded,
      textColor: AppColors.white,
      backgroundColor: AppColors.error,
    ).show(this);
  }

  void showSuccessMessage({String? message}) {
    _flushbar(
      context: this,
      message: message ?? 'Success',
      icon: Icons.check,
      textColor: AppColors.white,
      backgroundColor: AppColors.primaryColor,
    ).show(this);
  }

  static Future<void> showWarning(
    BuildContext context, {
    String title = "Warning!",
    required String message,
    VoidCallback? afterAction,
  }) {
    return _flushbar(
      context: context,
      message: message,
      icon: Icons.info_outline_rounded,
      textColor: AppColors.white,
      backgroundColor: AppColors.primaryLight,
    ).show(context).then((_) {
      afterAction?.call();
    });
  }

  static Future<void> showInfo(
    BuildContext context, {
    String title = "Info!",
    required String message,
    VoidCallback? afterAction,
  }) {
    return _flushbar(
      context: context,
      message: message,
      icon: Icons.info_outline_rounded,
      textColor: AppColors.white,
      backgroundColor: AppColors.primaryLight,
    ).show(context).then((_) {
      afterAction?.call();
    });
  }

  static Flushbar _flushbar({
    required BuildContext context,
    required String message,
    required IconData icon,
    Color textColor = AppColors.white,
    Color backgroundColor = AppColors.primaryColor,
  }) {
    return Flushbar(
      message: message,
      messageText: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(color: textColor),
              ),
            ),
            XMargin(10),
            Icon(icon, color: textColor),
          ],
        ),
      ),
      messageColor: textColor,
      backgroundColor: backgroundColor,
      duration: const Duration(seconds: kFlushBarDuration),
      flushbarPosition: FlushbarPosition.TOP,
      borderRadius: BorderRadius.circular(100),
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      isDismissible: true,
    );
  }
}
