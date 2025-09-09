
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:prodev/core/styles/typography/text_styles.dart';
import 'package:prodev/core/utils/spacer.dart';
import 'package:prodev/resources/colors.dart';

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({
    super.key,
    required this.text,
    this.icon,
    this.borderRadius,
    this.onTap,
    this.showSuffixArrow = true,
    this.prefix,
    this.backgroundColor,
    this.suffix,
    this.textColor = const Color(0xFF535151),
  });
  final String text;
  final String? icon;
  final void Function()? onTap;
  final BorderRadiusGeometry? borderRadius;
  final bool showSuffixArrow;
  final Widget? prefix;
  final Widget? suffix;
  final Color? backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.white,
          borderRadius:
              borderRadius ??
              BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
        ),
        child: Row(
          children: [
            if (icon != null) ...[
              SvgPicture.asset(icon!, height: 24.h, width: 24.w),
              XMargin(8),
            ] else if (prefix != null) ...[
              prefix ?? const SizedBox.shrink(),
              XMargin(8),
            ],
            Text(
              text,
              style: AppTextStyles.bodySmall.copyWith(
                fontSize: 14.sp,
                color: textColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            // suffix ??
            //     Visibility(
            //       visible: showSuffixArrow,
            //       child: Assets.icons.svg.chevronDown.svg(
            //         height: 20.h,
            //         width: 20.w,
            //         colorFilter: textColor.colorFilter,
            //       ),
            //     ),
          ],
        ),
      ),
    );
  }
}
