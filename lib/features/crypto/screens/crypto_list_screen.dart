import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prodev/core/hooks/use_init_hook.dart';
import 'package:prodev/features/crypto/provider/crypto_provider.dart';
import 'package:prodev/resources/colors.dart';

class CryptoListScreen extends HookConsumerWidget {
  const CryptoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoProvider = ref.watch(cryptoNotifierProvider);

    useInitAsync(() {
      cryptoProvider.getCryptocurrencyList(
        onError: (val) {},
        onSuccess: (val) {},
      );
    });
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Cryptocurrencies',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.textColor,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(),
    );
  }
}
