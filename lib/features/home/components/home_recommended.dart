import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prodev/core/hooks/use_init_hook.dart';
import 'package:prodev/core/styles/typography/text_styles.dart';
import 'package:prodev/core/utils/import.dart';
import 'package:prodev/core/utils/spacer.dart';
import 'package:prodev/core/widgets/app_loading_widget.dart';
import 'package:prodev/core/widgets/extended_image.dart';
import 'package:prodev/features/home/provider/auth_provider.dart';
import 'package:prodev/resources/colors.dart';

class HomeRecommended extends HookConsumerWidget {
  const HomeRecommended({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeVM = ref.watch(authNotifierProvider);
    final loading = useState(false);
    useInitAsync(() {
      loading.value = true;
      homeVM.getRecentlyPlayed(
        onSuccess: (val) {
          loading.value = false;
        },
        onError: (val) {
          loading.value = false;
        },
      );
    });
    return loading.value
        ? Center(child: AppLoading())
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Recommend for you',
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
            ListView.separated(
              itemCount: homeVM.newReleaseResponse.albums.items.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => YMargin(17),
              itemBuilder: (context, index) {
                final val = homeVM.newReleaseResponse.albums.items[index];
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ExtendedImageWidget.network(
                      val.images.last.url,
                      height: 88,
                      width: 88,
                      borderRadius: 8,
                      fit: BoxFit.cover,
                    ),
                    XMargin(15),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            val.name,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.customColor2,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp,
                              height: 20 / 17,
                              letterSpacing: -0.24,
                            ),
                          ),
                          YMargin(5),
                          Text(
                            val.artists.first.name,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.customColor2,
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                              height: 18 / 13,
                              letterSpacing: -0.24,
                            ),
                          ),
                          YMargin(5),
                          Text(
                            '114k / steams',
                            textAlign: TextAlign.center,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.customColor2,
                              fontWeight: FontWeight.w400,
                              fontSize: 13.sp,
                              height: 18 / 13,
                              letterSpacing: -0.24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),

            //     List
          ],
        );
  }
}
