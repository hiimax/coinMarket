// import 'package:pinput/pinput.dart';
// import 'package:coin_market/core/utils/import.dart';
// import 'package:coin_market/resources/colors.dart';
// import 'package:coin_market/resources/resources.dart';

// class PinInputWidget extends StatelessWidget {
//   const PinInputWidget({
//     super.key,
//     required this.controller,
//     this.onCompleted,
//     this.length = 6,
//     this.onChanged,
//     this.errorText = '',
//     this.size,
//   });

//   final TextEditingController controller;
//   final Function(String)? onCompleted;
//   final Function(String)? onChanged;
//   final String? errorText;
//   final int length;
//   final double? size;

//   @override
//   Widget build(BuildContext context) {
//     final _theme = Theme.of(context).textTheme.bodyMedium!;
//     final defaultPinTheme = PinTheme(
//       width: size ?? 52,
//       height: size ?? 52,
//       textStyle: _theme.copyWith(
//         color: AppColors.white,
//         fontWeight: FontWeight.w400,
//         fontSize: 12.25,
//       ),
//       margin: const EdgeInsets.symmetric(horizontal: 3),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(8),
//         color: AppColors.transparent,
//         border: Border.all(color: AppColors.grey),
//         shape: BoxShape.rectangle,
//       ),
//     );

//     return Center(
//       child: Pinput(
//         length: length,
//         autofocus: false,
//         obscureText: true,
//         showCursor: true,
//         controller: controller,
//         readOnly: false,
//         obscuringWidget: SvgPicture.asset(SvgIcons.obscure),
//         obscuringCharacter: '*',
//         forceErrorState: errorText?.isNotEmpty ?? false,
//         errorText: errorText,
//         errorBuilder: (String? error, _) {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(height: 12),
//               Center(
//                 child: Text(
//                   error ?? 'Error',
//                   style: _theme.copyWith(
//                     color: AppColors.error,
//                     fontWeight: FontWeight.w400,
//                     fontSize: 12.25,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//         defaultPinTheme: defaultPinTheme,
//         focusedPinTheme: defaultPinTheme.copyDecorationWith(
//           color: AppColors.transparent,
//           border: Border.all(color: AppColors.primaryColor, width: 1),
//           shape: BoxShape.circle,
//         ),
//         submittedPinTheme: defaultPinTheme.copyWith(
//           textStyle: const TextStyle(
//             color: AppColors.primaryColor,
//             fontSize: 36,
//             fontWeight: FontWeight.w500,
//             fontFamily: 'Poppins',
//           ),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: AppColors.primaryColor, width: 1),
//             shape: BoxShape.rectangle,
//           ),
//         ),
//         errorPinTheme: defaultPinTheme.copyDecorationWith(
//           color: Colors.red.withOpacity(0.5),
//           border: Border.all(color: Colors.red.withOpacity(.5)),
//         ),
//         onCompleted: onCompleted,
//         onChanged: onChanged,
//       ),
//     );
//   }
// }
