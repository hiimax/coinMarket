import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:load_switch/load_switch.dart';
import 'package:coin_market/core/utils/import.dart';
import 'package:coin_market/resources/colors.dart';

class AppSwitch extends HookWidget {
  const AppSwitch({
    super.key,
    required this.value,
    required this.future,
    required this.onChange,
    required this.onTap,
  });
  final bool value;
  final Future<bool> Function() future;
  final Function(bool) onChange;
  final Function(bool) onTap;
  @override
  Widget build(BuildContext context) {
    return LoadSwitch(
      value: value,
      future: future,
      width: 35,
      height: 22,
      style: SpinStyle.material,
      curveIn: Curves.easeInBack,
      curveOut: Curves.easeOutBack,
      animationDuration: const Duration(milliseconds: 500),
      switchDecoration:
          (value, _) => BoxDecoration(
            color: value ? AppColors.neutral0 : AppColors.grey,
            borderRadius: BorderRadius.circular(30),
            shape: BoxShape.rectangle,
          ),
      spinColor: (value) => AppColors.neutral0,
      spinStrokeWidth: 3,
      thumbSizeRatio: 0.8,
      thumbDecoration:
          (value, _) => BoxDecoration(
            color: AppColors.neutral0,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 4, color: AppColors.white),
            shape: BoxShape.rectangle,
          ),
      onChange: onChange,
      onTap: onTap,
    );
  }
}
