import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:coin_market/core/utils/spacer.dart';
import 'package:coin_market/core/widgets/keyboard_focus_detector.dart';
import 'package:coin_market/resources/colors.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.sub,
    this.bgColor,
    this.isDismissible = true,
    this.horizontalPadding = 24,
    this.isScrollable = true,
    this.titleStyle,
    this.showDragHandle = false,
  });

  final Widget child;
  final Color? bgColor;
  final String? title;
  final String? sub;
  final bool isDismissible;
  final double horizontalPadding;
  final bool isScrollable;
  final TextStyle? titleStyle;
  final bool showDragHandle;

  static Future show(
    BuildContext context, {
    required Widget child,
    String title = "",
    String sub = "",
    Color? bgColor,
    bool isDismissible = true,
    double horizontalPadding = 24,
    bool isScrollable = true,
    bool expand = false,
    TextStyle? titleStyle,
    bool showDragHandle = false,
    bool enableDrag = true,
  }) {
    return showCupertinoModalBottomSheet(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      topRadius: const Radius.circular(32),
      expand: expand,
      builder:
          (_) => AppBottomSheet(
            title: title,
            titleStyle: titleStyle,
            sub: sub,
            horizontalPadding: horizontalPadding,
            isDismissible: isDismissible,
            isScrollable: isScrollable,
            bgColor: bgColor,
            showDragHandle: showDragHandle,
            child: child,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bgColor ?? AppColors.white,
      child: SafeArea(
        child:
            isScrollable
                ? SingleChildScrollView(child: _buildBody(context))
                : _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final bottomInsets = MediaQuery.of(context).viewInsets.bottom;

    return KeyboardFocusDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: showDragHandle,
            child: Center(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: const Color(0xFFB9C0C9),
                  borderRadius: BorderRadius.circular(100),
                ),
                height: 5,
                width: 56,
              ),
            ),
          ),
          if (title != '') ...[
            const YMargin(10),
            Text(
              FlutterI18n.translate(context, title ?? ''),
              style: TextStyle(
                color: AppColors.primary80,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const YMargin(8),
          ],
          const YMargin(16),
          isScrollable ? child : Expanded(child: child),
          const YMargin(16),
          YMargin(bottomInsets),
        ],
      ),
    );
  }
}
