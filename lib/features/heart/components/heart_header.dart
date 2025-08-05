import 'package:prodev/core/styles/typography/text_styles.dart';
import 'package:prodev/core/utils/import.dart';
import 'package:prodev/core/utils/spacer.dart';
import 'package:prodev/core/widgets/extended_image.dart';
import 'package:prodev/resources/colors.dart';
import 'package:prodev/resources/resources.dart';

class HeartHeader extends StatelessWidget {
  const HeartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExtendedImageWidget.asset(
          Images.heartPic,
          height: 100,
          width: 91,
          borderRadius: 10,
          fit: BoxFit.cover,
        ),
        XMargin(12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sarwar Jahan',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.customColor2,
                fontWeight: FontWeight.w400,
                fontSize: 18.sp,
                letterSpacing: -0.24,
              ),
            ),
            YMargin(2),
            Text(
              'sarwarmusic@gmail.com',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.customColor3,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                letterSpacing: -0.24,
              ),
            ),
            YMargin(11),
            Text(
              'Gold Member',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.customColor3,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                letterSpacing: -0.24,
              ),
            ),
            YMargin(13),
            Text(
              'Love Music and I am not\nan Musician .',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.customColor3,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                letterSpacing: -0.24,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
