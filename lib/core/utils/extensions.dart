import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:timeago/timeago.dart';

final urlRegex = RegExp(
  r'(?:https?://)?(?:www\.)?([a-zA-Z0-9-]+\.[a-zA-Z]{2,})(?:/[^ ]*)?',
);

extension StringExtensions on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  bool get isUrl => urlRegex.hasMatch(this);

  List<String> splitStringByUrls() {
    final Iterable<Match> matches = urlRegex.allMatches(this);

    final result = <String>[];
    var lastIndex = 0;
    for (final match in matches) {
      result
        ..add(substring(lastIndex, match.start))
        ..add(match.group(0)!);
      lastIndex = match.end;
    }
    result.add(substring(lastIndex));

    return result;
  }
}

extension NumberExtensions on int {
  String toK() {
    final numberFormat = NumberFormat.compact();
    return numberFormat.format(this);
  }
}

extension DateExtensions on DateTime {
  String notificationDateFormat() {
    return DateFormat('EEE dd, yyyy • h:MM a').format(this);
  }
}

class MyCustomMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'just now';
  @override
  String aboutAMinute(int minutes) => '${minutes}m ago';
  @override
  String minutes(int minutes) => '${minutes}m ago';
  @override
  String aboutAnHour(int minutes) => '1h ago';
  @override
  String hours(int hours) => '${hours}h ago';
  @override
  String aDay(int hours) => '1d ago';
  @override
  String days(int days) => '${days}d ago';
  @override
  String aboutAMonth(int days) => '${days}d ago';
  @override
  String months(int months) => '$months months ago';
  @override
  String aboutAYear(int year) => '${year}y ago';
  @override
  String years(int years) => '${years}y ago';
  @override
  String wordSeparator() => ' ';
}

String formatBalance(String balance, int? decimalPlaces, String symbol) {
  double value = int.parse(balance).toDouble();
  final formatter = NumberFormat.currency(
    locale: "en_NG",
    symbol: symbol,
    decimalDigits: decimalPlaces ?? 2,
  );
  return formatter.format(value);
}

String calculateCharge(
  String fee,
  String charge,
  String symbol,
) {
  double _fee = int.parse(fee).toDouble();
  double _charge = int.parse(charge).toDouble();
  double value = _fee + _charge;

  final formatter = NumberFormat.currency(
    locale: "en_NG",
    symbol: symbol,
    decimalDigits: 2,
  );

  return formatter.format(value);
}
String calculateExchangeRate(
  String amount,
  String rate,
  String symbol,
) {
  double _amount = double.tryParse(amount) ?? 0.0;
  double _rate = double.tryParse(rate) ?? 0.0;
  double value = _amount * _rate;

  final formatter = NumberFormat.currency(
    locale: "en_NG",  // Adjust the locale if needed
    symbol: symbol,
    decimalDigits: 2,
  );

  return formatter.format(value);
}
String formatDate(String? date, {String format = "dd MMM yyyy"}) {
  return DateFormat(format).format(
      DateTime.tryParse(date ?? DateTime.now().toString()) ?? DateTime.now());
}

Future<XFile> convertUrlToFile(String imageUrl) async {
  var rng = new Random();
  Directory tempDir = await getTemporaryDirectory();
  String tempPath = tempDir.path;
  File file = new File('$tempPath' + (rng.nextInt(100)).toString() + '.png');
  final response = await Dio()
      .get(imageUrl, options: Options(responseType: ResponseType.bytes));
  await file.writeAsBytes(response.data);
  return XFile(file.path);
}
