import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prodev/core/extensions/extension.dart';
import 'package:prodev/core/styles/typography/text_styles.dart';
import 'package:prodev/core/utils/import.dart';
import 'package:prodev/core/utils/spacer.dart';
import 'package:prodev/core/widgets/extended_image.dart';
import 'package:prodev/resources/colors.dart';
import 'package:prodev/resources/resources.dart';

class MusicScreen extends HookConsumerWidget {
  const MusicScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Spacer(),
              Text(
                'Ophelia by Steven',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.customColor2,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.sp,
                  letterSpacing: -0.24,
                ),
              ),
              Spacer(),
              SvgPicture.asset(SvgIcons.heartIcon),
            ],
          ),
          YMargin(32),
          ExtendedImageWidget.asset(
            Images.cover,
            height: 319,
            width: 302,
            borderRadius: 8,
            fit: BoxFit.cover,
          ),
          YMargin(28),
          Text(
            'Ophelia',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.customColor2,
              fontWeight: FontWeight.w400,
              fontSize: 24.sp,
              letterSpacing: -0.24,
            ),
          ),
          YMargin(7),
          Text(
            'Steven Price',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.customColor3,
              fontWeight: FontWeight.w400,
              fontSize: 18.sp,
              letterSpacing: -0.24,
            ),
          ),
          YMargin(41),
          LinearProgressIndicator(),
          Row(
            children: [
              Text(
                '1:25',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.customColor2,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  letterSpacing: -0.24,
                ),
              ),
              Spacer(),
              Text(
                '3:15',
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.customColor2,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  letterSpacing: -0.24,
                ),
              ),
            ],
          ),
          YMargin(34),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SvgPicture.asset(SvgIcons.shuffle),
              SvgPicture.asset(SvgIcons.skipBack),
              Container(
                width: 74.w,
                height: 74.h,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.customColor4,
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(SvgIcons.pause),
              ),
              SvgPicture.asset(SvgIcons.skipForward),
              SvgPicture.asset(SvgIcons.repeat),
            ],
          ),
        ],
      ).paddingSymmetric(horizontal: 21, vertical: 16),
    );
  }
}
