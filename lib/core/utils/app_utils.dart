// ignore_for_file: deprecated_member_use

import 'package:intl/intl.dart';
import 'package:coin_market/core/functions/dialog.dart';
import 'package:coin_market/core/utils/enable_photo_permission_dialog.dart';
import 'package:coin_market/core/utils/import.dart';
import 'package:coin_market/core/utils/toast_util.dart';

import 'package:url_launcher/url_launcher.dart';

class AppUtils {
  AppUtils._();

  static Color getColorFromHex(String hexColor) {
    final buffer = StringBuffer();
    if (hexColor.length == 6 || hexColor.length == 7) buffer.write('ff');
    buffer.write(hexColor.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static String formatCurrency(double amount, {String? currency}) {
    final numberFormat = NumberFormat.currency(
      locale: 'en_US',
      symbol: '₦',
      decimalDigits: 2,
    );
    return numberFormat.format(amount);
  }

  static String removeInitialZero(String value) {
    if (value.startsWith('0')) {
      value = value.substring(1);
    }

    return value;
  }

  static Future<void> openEmail({
    required String email,
    String? subject,
    String? body,
  }) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        if (subject != null) 'subject': subject,
        if (body != null) 'body': body,
      },
    );

    if (await canLaunch(emailUri.toString())) {
      await launch(emailUri.toString());
    } else {
      throw 'Could not launch email';
    }
  }

  

  static Future<void> openWhatsAppChat({
    required String phoneNumber,
    String? message,
  }) async {
    final Uri whatsappUri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: '/$phoneNumber',
      queryParameters: {if (message != null) 'text': message},
    );

    if (await canLaunch(whatsappUri.toString())) {
      await launch(whatsappUri.toString());
    } else {
      throw 'Could not launch WhatsApp';
    }
  }

  static Future<void> copyToClipboard(context, String? text) async {
    if (text != null && text.isNotEmpty) {
      await Clipboard.setData(ClipboardData(text: text));
      context.showSuccessMessage(context, message: "Copied!");
    }
  }

  

  // Share image
  
  static Future<bool> openUrl(String url) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        return launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
      }
      return false;
    } catch (e) {
      return false;
    }
  }
 static String formatNumber(num number) {
    if (number >= 1e12) {
      return '${(number / 1e12).toStringAsFixed(1)}T';
    } else if (number >= 1e9) {
      return '${(number / 1e9).toStringAsFixed(1)}B';
    } else if (number >= 1e6) {
      return '${(number / 1e6).toStringAsFixed(1)}M';
    } else if (number >= 1e3) {
      return '${(number / 1e3).toStringAsFixed(1)}K';
    } else {
      return number.toStringAsFixed(0);
    }
  }
}
