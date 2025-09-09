import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:coin_market/resources/colors.dart';

class AppCheckListTile extends HookWidget {
  const AppCheckListTile({
    required this.text,
    this.textSize,
    required this.value,
    this.fontWeight,
    this.textColor,
    this.onChanged,
    this.highlightColor,
    this.controlAffinity,
    this.padding,
    this.scale,
    super.key,
  });

  final bool value;
  final Function(bool?)? onChanged;
  final String text;
  final Color? highlightColor, textColor;
  final ListTileControlAffinity? controlAffinity;
  final EdgeInsetsGeometry? padding;
  final double? scale;
  final double? textSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox.adaptive(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          value: value,
          onChanged: onChanged,
          activeColor: AppColors.primaryColor,
          side: const BorderSide(color: AppColors.primaryColor),
        ),
        Text(
          text,
          style: TextStyle(
            color: textColor ?? AppColors.pureBlack,
            fontSize: textSize,
            fontWeight: fontWeight,
          ),
        ),
      ],
    );
  }
}
