import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:coin_market/resources/resources.dart';

void main() {
  test('svg_icons assets test', () {
    expect(File(SvgIcons.heartIcon).existsSync(), isTrue);
    expect(File(SvgIcons.heartActive).existsSync(), isTrue);
    expect(File(SvgIcons.heartInactive).existsSync(), isTrue);
    expect(File(SvgIcons.homeActive).existsSync(), isTrue);
    expect(File(SvgIcons.homeInactive).existsSync(), isTrue);
    expect(File(SvgIcons.mapPin).existsSync(), isTrue);
    expect(File(SvgIcons.musicActive).existsSync(), isTrue);
    expect(File(SvgIcons.musicInactive).existsSync(), isTrue);
    expect(File(SvgIcons.notification).existsSync(), isTrue);
    expect(File(SvgIcons.pause).existsSync(), isTrue);
    expect(File(SvgIcons.repeat).existsSync(), isTrue);
    expect(File(SvgIcons.search).existsSync(), isTrue);
    expect(File(SvgIcons.shuffle).existsSync(), isTrue);
    expect(File(SvgIcons.skipBack).existsSync(), isTrue);
    expect(File(SvgIcons.skipForward).existsSync(), isTrue);
  });
}
