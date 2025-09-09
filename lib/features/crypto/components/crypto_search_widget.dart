import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coin_market/resources/colors.dart';


class CryptoFilterChips extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;

  const CryptoFilterChips({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final filters = ['All', 'Top 10', 'Top 50', 'Top 100', 'Gainers', 'Losers'];

    return Container(
      height: 40.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          final filter = filters[index];
          final isSelected = selectedFilter == filter;

          return Container(
            margin: EdgeInsets.only(right: 8.w),
            child: FilterChip(
              label: Text(
                filter,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color:
                      isSelected
                          ? AppColors.white
                          : AppColors.textSecondaryColor,
                ),
              ),
              selected: isSelected,
              onSelected: (selected) {
                onFilterChanged(filter);
              },
              backgroundColor: AppColors.white,
              selectedColor: AppColors.primaryColor,
              checkmarkColor: AppColors.white,
              side: BorderSide(
                color:
                    isSelected ? AppColors.primaryColor : AppColors.neutral400,
                width: 1,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CryptoSortDropdown extends StatelessWidget {
  final String selectedSort;
  final ValueChanged<String> onSortChanged;

  const CryptoSortDropdown({
    super.key,
    required this.selectedSort,
    required this.onSortChanged,
  });

  @override
  Widget build(BuildContext context) {
    final sortOptions = [
      'Market Cap',
      'Price',
      '24h Change',
      '7d Change',
      'Volume',
      'Name',
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.neutral400, width: 1),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedSort,
          isExpanded: true,
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.textSecondaryColor,
          ),
          style: TextStyle(fontSize: 14.sp, color: AppColors.textColor),
          items:
              sortOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              onSortChanged(newValue);
            }
          },
        ),
      ),
    );
  }
}
