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

class HomeRecentlyPlayed extends HookConsumerWidget {
  const HomeRecentlyPlayed({super.key});

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
              'Recently Played',
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
            SizedBox(
              height: 110.h,
              child: ListView.separated(
                itemCount: homeVM.newReleaseResponse.albums.items.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                separatorBuilder: (context, index) => XMargin(16),
                itemBuilder: (context, index) {
                  final val = homeVM.newReleaseResponse.albums.items[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ExtendedImageWidget.network(
                        val.images.first.url,
                        height: 81,
                        width: 101,
                        borderRadius: 10,
                        fit: BoxFit.cover,
                      ),
                      YMargin(6),
                      Text(
                        val.name,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.customColor2,
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          height: 20 / 14,
                          letterSpacing: -0.24,
                        ),
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
