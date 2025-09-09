// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:coin_market/core/utils/import.dart';
// import 'package:coin_market/core/utils/spacer.dart';
// import 'package:coin_market/resources/colors.dart';
// import 'package:coin_market/resources/resources.dart';

// class CounterWidget extends HookWidget {
//   final int initialValue;
//   final Function(int)? onValueChanged;
//   final double? radius, iconSize, height, space;
//   final Color? bgColor;

//   const CounterWidget({
//     super.key,
//     this.radius,
//     this.bgColor,
//     this.initialValue = 1,
//     this.iconSize = 24,
//     this.height = 48,
//     this.space = 20,
//     this.onValueChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final counter = useState(initialValue); // Hook for local state
//     final _theme = Theme.of(context).textTheme.bodyMedium!;
//     void increment() {
//       counter.value++;
//       onValueChanged?.call(counter.value);
//     }

//     void decrement() {
//       if (counter.value > 1) {
//         counter.value--;
//         onValueChanged?.call(counter.value);
//       }
//     }

//     return Container(
//       height: height,
//       decoration: BoxDecoration(
//         color: bgColor ?? AppColors.neutral0,
//         borderRadius: BorderRadius.circular(radius ?? 100),
//         border: Border.all(color: bgColor ?? AppColors.customColor34),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           XMargin(10),
//           GestureDetector(
//             child: SvgPicture.asset(
//               SvgIcons.minus,
//               width: iconSize,
//               height: iconSize,
//             ),
//             onTap: decrement,
//           ),
//           XMargin(space ?? 0),
//           Text(
//             counter.value.toString(),
//             style: _theme.copyWith(
//               color: AppColors.pureBlack,
//               fontSize: 16,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           XMargin(space ?? 0),
//           GestureDetector(
//             child: SvgPicture.asset(
//               SvgIcons.plus,
//               width: iconSize,
//               height: iconSize,
//             ),
//             onTap: increment,
//           ),
//           XMargin(10),
//         ],
//       ),
//     );
//   }
// }
