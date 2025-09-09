import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:coin_market/core/utils/app_utils.dart';
import 'package:coin_market/core/utils/import.dart';
import 'package:coin_market/features/crypto/models/crypto_model.dart';
import 'package:coin_market/features/crypto/provider/crypto_provider.dart';

import '../../../resources/colors.dart';

class CryptoModal extends HookConsumerWidget {
  final CoinMarketData coin;
  const CryptoModal({super.key, required this.coin});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoProvider = ref.watch(cryptoNotifierProvider);
    final scrollController = useScrollController();
    final modalCoin = cryptoProvider.coinMarketResponseModel.data.where((element) => element.id == coin.id).firstOrNull ?? coin;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.neutral400,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              // Coin header
              Row(
                children: [
                  Container(
                    width: 50.w,
                    height: 50.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(25.r),
                    ),
                    child: Center(
                      child: Text(
                        modalCoin.symbol.substring(0, 1).toUpperCase(),
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          modalCoin.name,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textColor,
                          ),
                        ),
                        Text(
                          modalCoin.symbol.toUpperCase(),
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '\$${modalCoin.quote.uSD.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              // Price change
              Row(
                children: [
                  Icon(
                    modalCoin.quote.uSD.percentChange24h >= 0
                        ? Icons.trending_up
                        : Icons.trending_down,
                    color:
                        modalCoin.quote.uSD.percentChange24h >= 0
                            ? AppColors.success
                            : AppColors.errorColor,
                    size: 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    '${modalCoin.quote.uSD.percentChange24h >= 0 ? '+' : ''}${modalCoin.quote.uSD.percentChange24h.toStringAsFixed(2)}% (24h)',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color:
                          modalCoin.quote.uSD.percentChange24h >= 0
                              ? AppColors.success
                              : AppColors.errorColor,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // Market stats
              Text(
                'Market Statistics',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 16.h),

              // Stats grid
              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'Market Cap',
                      '\$${AppUtils.formatNumber(modalCoin.quote.uSD.marketCap)}',
                      AppColors.primaryColor,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildStatCard(
                      'Volume 24h',
                      '\$${AppUtils.formatNumber(modalCoin.quote.uSD.volume24h)}',
                      AppColors.blue,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12.h),

              Row(
                children: [
                  Expanded(
                    child: _buildStatCard(
                      'Circulating Supply',
                      AppUtils.formatNumber(modalCoin.circulatingSupply),
                      AppColors.success,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: _buildStatCard(
                      'Max Supply',
                      modalCoin.maxSupply > 0
                          ? AppUtils.formatNumber(modalCoin.maxSupply)
                          : '∞',
                      AppColors.orange,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: color.withOpacity(0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.textSecondaryColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
