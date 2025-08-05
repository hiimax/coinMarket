import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prodev/core/extensions/extension.dart';
import 'package:prodev/core/utils/spacer.dart';
import 'package:prodev/features/heart/components/heart_favorite.dart';
import 'package:prodev/features/heart/components/heart_featured.dart';
import 'package:prodev/features/heart/components/heart_header.dart';

class HeartScreen extends HookConsumerWidget {
  const HeartScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            YMargin(44),
            HeartHeader(),
            YMargin(60),
            HeartFeatured(),
            YMargin(32),
            HeartFavorite(),
          ],
        ).paddingSymmetric(horizontal: 21, vertical: 16),
      ),
    );
  }
}
