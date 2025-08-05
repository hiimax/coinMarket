import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prodev/core/extensions/extension.dart';
import 'package:prodev/core/hooks/use_init_hook.dart';
import 'package:prodev/core/utils/spacer.dart';
import 'package:prodev/features/home/components/home_header.dart';
import 'package:prodev/features/home/components/home_recently_played.dart';
import 'package:prodev/features/home/components/home_recommended.dart';
import 'package:prodev/features/home/components/home_search.dart';
import 'package:prodev/features/home/provider/auth_provider.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeVM = ref.watch(authNotifierProvider);
    useInitAsync(() {
      homeVM.getRecentlyPlayed(onSuccess: (val) {}, onError: (val) {});
    });
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeHeader(),
            YMargin(24),
            HomeSearch(),
            YMargin(44),
            HomeRecentlyPlayed(),
            YMargin(28),
            HomeRecommended(),
          ],
        ).paddingSymmetric(horizontal: 21, vertical: 16),
      ),
    );
  }
}
