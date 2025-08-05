import 'package:prodev/core/styles/typography/text_styles.dart';
import 'package:prodev/core/utils/import.dart';
import 'package:prodev/core/utils/spacer.dart';
import 'package:prodev/core/widgets/extended_image.dart';
import 'package:prodev/resources/colors.dart';
import 'package:prodev/resources/resources.dart';

class HeartFeatured extends StatelessWidget {
  const HeartFeatured({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Favourite Album',
          textAlign: TextAlign.center,
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.customColor2,
            fontWeight: FontWeight.w600,
            fontSize: 22.sp,
            height: 20 / 22,
            letterSpacing: -0.24,
          ),
        ),
        YMargin(24),
        SizedBox(
          height: 120.h,
          child: ListView.separated(
            itemCount: 7,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            separatorBuilder: (context, index) => XMargin(3),
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ExtendedImageWidget.asset(
                    Images.featured,
                    height: 111,
                    width: 102,
                    borderRadius: 10,
                    fit: BoxFit.cover,
                  ),
                ],
              );
            },
          ),
        ),

        //     List
      ],
    );
  }
}
