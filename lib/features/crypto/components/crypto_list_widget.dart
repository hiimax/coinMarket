import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:prodev/core/widgets/app_loading_widget.dart';
import 'package:prodev/features/crypto/components/crypto_coin_card.dart';
import 'package:prodev/features/crypto/models/crypto_model.dart';
import 'package:prodev/resources/colors.dart';

class CryptoListWidget extends StatelessWidget {
  final CoinMarketResponseModel coinMarketResponse;
  final bool isLoading;
  final Function(CoinMarketData)? onCoinTap;
  final VoidCallback? onRetry;

  const CryptoListWidget({
    super.key,
    required this.coinMarketResponse,
    this.isLoading = false,
    this.onCoinTap,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const AppLoading();
    } else if (coinMarketResponse.data.isEmpty && !isLoading) {
      return _buildEmptyState();
    } else
      return RefreshIndicator(
        onRefresh: () async {
          onRetry?.call();
        },
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          itemCount: coinMarketResponse.data.length,
          itemBuilder: (context, index) {
            final coin = coinMarketResponse.data[index];
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
