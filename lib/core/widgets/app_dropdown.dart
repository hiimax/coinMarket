// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:prodev/resources/colors.dart';
// import 'package:prodev/resources/resources.dart';

// class AppDropdown2<T> extends StatelessWidget {
//   const AppDropdown2({
//     super.key,
//     this.selectedValue,
//     this.onChanged,
//     required this.items,
//     required this.displayText,
//     this.bg,
//     this.textColor,
//     this.border,
//     this.labelText,
//     this.selectedColor,
//     this.selectedTextColor,
//     this.sub,
//     this.dropDownTitle,
//     this.canSearch = false,
//     this.loading = false,
//     this.showTick = true,
//     this.showBorder = true,
//     this.pillColor,
//   });

//   final T? selectedValue;
//   final Function(T?)? onChanged;
//   final List<T> items;
//   final String? labelText;
//   final String? dropDownTitle;
//   final String? sub;
//   final bool loading;
//   final bool canSearch;
//   final String Function(T) displayText;
//   final Color? bg, textColor, border, selectedColor, selectedTextColor;
//   final bool showTick;
//   final bool showBorder;
//   final Color? pillColor;

//   @override
//   Widget build(BuildContext context) {
//     return DropdownButtonHideUnderline(
//       child: ButtonTheme(
//         height: 20,
//         minWidth: 103,
//         alignedDropdown: true,
//         child: DropdownButton2(
//           isExpanded: true,
//           isDense: true,
//           iconStyleData: IconStyleData(
//             icon: SvgPicture.asset(SvgIcons.playArrowFilled, width: 20),
//           ),
//           hint: Text(
//             'Full Price Details',
//             style: TextStyle(color: AppColors.customColor49, fontSize: 10.sp),
//           ),
//           items:
//               items
//                   .map(
//                     (item) => DropdownMenuItem<T>(
//                       value: item,
//                       child: Text(
//                         displayText(item),
//                         style: TextStyle(
//                           fontSize: 9.sp,
//                           color: AppColors.customColor30,
//                         ),
//                       ),
//                     ),
//                   )
//                   .toList(),
//           value: selectedValue,
//           onChanged: onChanged,
//           buttonStyleData: ButtonStyleData(
//             padding: const EdgeInsets.symmetric(horizontal: 2),
//             decoration: BoxDecoration(
//               color: AppColors.customColor4,
//               borderRadius: BorderRadius.circular(5),
//             ),
//           ),
//           dropdownStyleData: DropdownStyleData(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: AppColors.white,
//               border: Border.all(width: 1, color: AppColors.pureBlack),
//             ),
//             offset: const Offset(0, -5),
//           ),
//         ),
//       ),
//     );
//   }
// }
