import 'package:prodev/core/extensions/extension.dart';
import 'package:prodev/core/styles/typography/text_styles.dart';
import 'package:prodev/core/utils/import.dart';
import 'package:prodev/core/utils/spacer.dart';
import 'package:prodev/core/widgets/app_textfield.dart';
import 'package:prodev/resources/colors.dart';
import 'package:prodev/resources/resources.dart';

class HomeSearch extends StatelessWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Listen The\nLatest Musics',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.customColor2,
            fontWeight: FontWeight.w600,
            fontSize: 26.sp,
            letterSpacing: -0.24,
          ),
        ),
        XMargin(12),
        Expanded(
          child: AppTextField(
            hintText: 'Search Music',
            prefixIconConstraints: BoxConstraints(
              maxWidth: 40.w,
              maxHeight: 30.h,
            ),
            prefixIcon: SvgPicture.asset(
              SvgIcons.search,
            ).paddingSymmetric(horizontal: 7),
          ),
        ),
      ],
    );
  }
}
