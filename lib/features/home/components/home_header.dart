import 'package:prodev/core/styles/typography/text_styles.dart';
import 'package:prodev/core/utils/import.dart';
import 'package:prodev/core/utils/spacer.dart';
import 'package:prodev/core/widgets/extended_image.dart';
import 'package:prodev/resources/colors.dart';
import 'package:prodev/resources/resources.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ExtendedImageWidget.asset(
          Images.profilePic,
          height: 40,
          width: 40,
          borderRadius: 100,
          fit: BoxFit.cover,
        ),
        XMargin(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sarwar Jahan',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.customColor2,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp,
                height: 20 / 18,
                letterSpacing: -0.24,
              ),
            ),
            Text(
              'Gold Member',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.customColor2,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                height: 20 / 14,
                letterSpacing: -0.24,
              ),
            ),
          ],
        ),
        Spacer(),
        SvgPicture.asset(SvgIcons.notification),
      ],
    );
  }
}
