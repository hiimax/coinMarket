import 'package:coin_market/core/hooks/use_init_hook.dart';
import 'package:coin_market/core/hooks/use_interval.dart';
import 'package:coin_market/core/singletons.dart';
import 'package:coin_market/core/utils/toast_util.dart';
import 'package:coin_market/core/widgets/app_textfield.dart';
import 'package:coin_market/features/crypto/components/crypto_header.dart';
import 'package:coin_market/features/crypto/components/crypto_list_widget.dart';
import 'package:coin_market/features/crypto/components/crypto_modal.dart';
import 'package:coin_market/features/crypto/components/crypto_search_widget.dart';
import 'package:coin_market/features/crypto/provider/crypto_provider.dart';
import 'package:coin_market/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CryptoListScreen extends HookConsumerWidget {
  const CryptoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cryptoProvider = ref.watch(cryptoNotifierProvider);
    final searchController = useTextEditingController();
    final isLoading = useState(false);
    String selectedFilter = 'All';
    String selectedSort = 'Market Cap';

    useInitAsync(() {
      isLoading.value = true;
      cryptoProvider.getCryptocurrencyList(
        onError: (val) {
          isLoading.value = false;

          context.showErrorMessage(message: val);
        },
        onSuccess: (val) {
          cryptoProvider.setSearchedList();
          isLoading.value = false;
        },
      );
    });
    useInterval(() {
      cryptoProvider.getCryptocurrencyList(
        onError: (val) {},
        onSuccess: (val) {
          cryptoProvider.setSearchedList();
        },
      );
    }, const Duration(seconds: 10));

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text(
          'Coin Market',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Header with stats
          CryptoListHeader(
            totalCount:
                cryptoProvider.coinMarketResponseModel.status.totalCount
                    .toInt(),
            lastUpdated:
                cryptoProvider.coinMarketResponseModel.status.timestamp,
          ),

          // Search bar
          AppTextField(
            hintText: 'Search cryptocurrencies...',
            controller: searchController,
            onChanged: (value) {
              cryptoProvider.setQuery(value);
              cryptoProvider.setSearchedList();
            },
          ),

          // Filter chips
          CryptoFilterChips(
            selectedFilter: selectedFilter,
            onFilterChanged: (filter) {
              // TODO: Implement filter functionality
            },
          ),

          // Sort dropdown
          CryptoSortDropdown(
            selectedSort: selectedSort,
            onSortChanged: (sort) {
              // TODO: Implement sort functionality
            },
          ),

          // Crypto list
          Expanded(
            child: CryptoListWidget(
              isLoading: isLoading.value,
              onCoinTap: (coin) {
                bottomSheetInstanceService.openPrimaryBottomSheet(
                  context: context,
                  bottomSheetWidget: CryptoModal(coin: coin),
                  isScrollControlled: true,
                );
              },
              onRetry: () {
                cryptoProvider.getCryptocurrencyList(
                  onError: (val) {},
                  onSuccess: (val) {
                    cryptoProvider.setSearchedList();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
