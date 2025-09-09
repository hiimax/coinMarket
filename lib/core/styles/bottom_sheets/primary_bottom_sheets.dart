import 'package:coin_market/app/router.dart';
import 'package:coin_market/core/utils/import.dart';
import 'package:coin_market/resources/colors.dart';

abstract class AbstractCoinMarketBottomSheets {
  Future<bool?> openPrimaryBottomSheet({
    BuildContext? context,
    required Widget bottomSheetWidget,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    bool? enableDrag,
    AnimationController? transitionAnimationController,
  });
}

class CoinMarketBottomSheets implements AbstractCoinMarketBottomSheets {
  // A singleton class that implements an abstract flowWidgetBottomSheet
  CoinMarketBottomSheets._();
  static final CoinMarketBottomSheets instance = CoinMarketBottomSheets._();

  factory CoinMarketBottomSheets() {
    return instance;
  }

  @override
  Future<bool?> openPrimaryBottomSheet({
    BuildContext? context,
    required Widget bottomSheetWidget,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    BoxConstraints? constraints,
    bool? enableDrag = true,
    AnimationController? transitionAnimationController,
    bool isScrollControlled = false,
    bool isDismissible = true,
  }) async {
    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(24.sp),
      topRight: Radius.circular(24.sp),
    );

    return await showModalBottomSheet(
      enableDrag: enableDrag ?? true,
      isDismissible: isDismissible,
      isScrollControlled: isScrollControlled,
      backgroundColor: backgroundColor ?? AppColors.neutral600,
      elevation: elevation,
      shape: shape ?? RoundedRectangleBorder(borderRadius: borderRadius),
      clipBehavior: clipBehavior,
      constraints: constraints,
      transitionAnimationController: transitionAnimationController,
      context: context ?? rootNavigatorKey.currentContext!,
      builder: (context) {
        final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

        // return Container(
        //   margin: EdgeInsets.only(bottom: bottomPadding),
        //   decoration: BoxDecoration(
        //     color: backgroundColor ?? AppColors.neutral60050,
        //     borderRadius: borderRadius,
        //   ),
        //   child: Wrap(
        //     children: [bottomSheetWidget],
        //   ),
        // );
        return Padding(
          padding: EdgeInsets.only(bottom: bottomPadding),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor ?? AppColors.neutral600,
                borderRadius: borderRadius,
              ),
              child: bottomSheetWidget,
            ),
          ),
        );
      },
    );
  }
}
