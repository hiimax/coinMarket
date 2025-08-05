import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:prodev/resources/resources.dart';

void main() {
  test('images assets test', () {
    expect(File(Images.cover).existsSync(), isTrue);
    expect(File(Images.favorite).existsSync(), isTrue);
    expect(File(Images.featured).existsSync(), isTrue);
    expect(File(Images.heartPic).existsSync(), isTrue);
    expect(File(Images.profilePic).existsSync(), isTrue);
    expect(File(Images.recently).existsSync(), isTrue);
    expect(File(Images.recommended).existsSync(), isTrue);
  });
}
