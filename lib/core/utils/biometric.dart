import 'package:local_auth/local_auth.dart';
import 'package:prodev/app/router.dart';
import 'package:prodev/core/utils/import.dart';

Future<bool> hasBiometrics() async {
  final _auth = LocalAuthentication();
  final isAvailable = await _auth.canCheckBiometrics;
  final isDeviceSupported = await _auth.isDeviceSupported();
  return isAvailable && isDeviceSupported;
}

void launchBiometric(context, VoidCallback success) async {
  final _auth = LocalAuthentication();
  final isAuthAvailable = await hasBiometrics();
  if (!isAuthAvailable) {
    if (rootNavigatorKey.currentContext!.mounted) {
      context.showErrorMessage(
        message: 'Biometric authentication not supported in this device',
      );
    }
  }
  try {
    final bool didAuthenticate = await _auth.authenticate(
      localizedReason:
          Platform.isIOS
              ? 'Use face ID  to login'
              : 'Touch your finger on the sensor to login',
      options: const AuthenticationOptions(
        stickyAuth: true,
        // biometricOnly: true,
      ),
    );
    if (didAuthenticate == true) {
      success();
    } else {
      if (rootNavigatorKey.currentContext!.mounted) {
        context.showErrorMessage(
          message: 'Unable to login, please try again later',
        );
      }
    }
  } on PlatformException catch (e) {
    if (rootNavigatorKey.currentContext!.mounted) {
      context.showErrorMessage(message: e.message ?? 'Please try again later');
    }
  }
}

Future<bool> launchFutureBiometric(context, bool success) async {
  final _auth = LocalAuthentication();
  final isAuthAvailable = await hasBiometrics();
  if (!isAuthAvailable) {
    if (rootNavigatorKey.currentContext!.mounted) {
      context.showErrorMessage(
        message: 'Biometric authentication not supported in this device',
      );
    }
  }
  try {
    final bool didAuthenticate = await _auth.authenticate(
      localizedReason:
          Platform.isIOS
              ? 'Use face ID  to login'
              : 'Touch your finger on the sensor to login',
      options: const AuthenticationOptions(
        stickyAuth: true,
        // biometricOnly: true,
      ),
    );
    if (didAuthenticate == true) {
      return success;
    } else {
      if (rootNavigatorKey.currentContext!.mounted) {
        context.showErrorMessage(
          message: 'Unable to login, please try again later',
        );
      }
      return false;
    }
  } on PlatformException catch (e) {
    if (rootNavigatorKey.currentContext!.mounted) {
      context.showErrorMessage(message: e.message ?? 'Please try again later');
    }
    return false;
  }
}
