import 'package:prodev/core/styles/typography/text_styles.dart';
import 'package:prodev/core/utils/import.dart';
import 'package:prodev/core/utils/spacer.dart';
import 'package:prodev/core/widgets/extended_image.dart';
import 'package:prodev/resources/colors.dart';
import 'package:prodev/resources/resources.dart';

class HeartFavorite extends StatelessWidget {
  const HeartFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Favourite Music',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.customColor2,
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
            height: 20 / 22,
            letterSpacing: -0.24,
          ),
        ),
        YMargin(16),
        GridView.builder(
          itemCount: 7,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 9,
            mainAxisSpacing: 9,
          ),
          itemBuilder: (context, index) {
            return ExtendedImageWidget.asset(
              Images.favorite,
              height: 111,
              width: 106,
              borderRadius: 8,
              fit: BoxFit.cover,
            );
          },
        ),

        //     List
      ],
    );
  }
}
