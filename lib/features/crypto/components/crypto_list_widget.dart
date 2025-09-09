import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:coin_market/core/widgets/app_loading_widget.dart';
import 'package:coin_market/features/crypto/components/crypto_coin_card.dart';
import 'package:coin_market/features/crypto/models/crypto_model.dart';
import 'package:coin_market/features/crypto/provider/crypto_provider.dart';
import 'package:coin_market/resources/colors.dart';

class CryptoListWidget extends HookConsumerWidget {
  final bool isLoading;
  final Function(CoinMarketData)? onCoinTap;
  final VoidCallback? onRetry;

  const CryptoListWidget({
    super.key,
    this.isLoading = false,
    this.onCoinTap,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoProvider = ref.watch(cryptoNotifierProvider);
    if (isLoading) {
      return const AppLoading(color: AppColors.primaryIcon);
    } else if (cryptoProvider.searchedList.isEmpty && !isLoading) {
      return _buildEmptyState();
    } else
      return RefreshIndicator(
        onRefresh: () async {
          onRetry?.call();
        },
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          itemCount: cryptoProvider.searchedList.length,
          itemBuilder: (context, index) {
            final coin = cryptoProvider.searchedList[index];
            return CryptoCoinCard(
              coin: coin,
              onTap: () => onCoinTap?.call(coin),
            );
          },
        ),
      );
  }
}

Widget _buildEmptyState() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.currency_bitcoin, size: 64.w, color: AppColors.neutral600),
        SizedBox(height: 16.h),
        Text(
          'No cryptocurrencies found',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondaryColor,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Try refreshing the list',
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.textSecondaryColor,
          ),
        ),
      ],
    ),
  );
}
