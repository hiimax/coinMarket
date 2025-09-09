// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:coin_market/resources/colors.dart';
// import 'package:coin_market/resources/resources.dart';

// /// Custom keyboard
// class CustomKeyBoard extends StatefulWidget {
//   /// Theme for the widget. Read more [PinTheme]
//   final Color pinTheme;

//   /// special key to be displayed on the widget. Default is '.'
//   final Widget? specialKey;

//   /// on changed function to be called when the amount is changed.
//   final Function(String)? onChanged;

//   /// on competed function to be called when the pin code is complete.
//   final Function(String)? onCompleted;

//   /// function to be called when special keys are pressed.
//   final Function()? specialKeyOnTap;

//   /// maximum length of the amount.
//   final int maxLength;

//   final TextEditingController controller;

//   final TextStyle? keysTextStyle;
//   final bool? ShowSpecialKey;

//   const CustomKeyBoard({
//     Key? key,
//     required this.maxLength,
//     this.pinTheme = AppColors.pureBlack,
//     this.specialKey,
//     this.onChanged,
//     this.specialKeyOnTap,
//     this.ShowSpecialKey,
//     this.onCompleted,
//     required this.controller,
//     this.keysTextStyle = const TextStyle(
//       fontSize: 22,
//       fontWeight: FontWeight.bold,
//     ),
//   }) : assert(maxLength > 0),
//        super(key: key);
//   @override
//   _CustomKeyBoardState createState() => _CustomKeyBoardState();
// }

// class _CustomKeyBoardState extends State<CustomKeyBoard> {
//   Widget buildNumberButton({int? number, Widget? icon, Function()? onPressed}) {
//     getChild() {
//       if (icon != null) {
//         return icon;
//       } else {
//         return Text(
//           number?.toString() ?? "",
//           style: widget.keysTextStyle?.copyWith(color: widget.pinTheme),
//         );
//       }
//     }

//     return Expanded(
//       child: CupertinoButton(
//         key: icon?.key ?? Key("btn$number"),
//         color: AppColors.white,
//         onPressed: onPressed,
//         child: getChild(),
//       ),
//     );
//   }

//   Widget buildNumberRow(List<int> numbers) {
//     List<Widget> buttonList =
//         numbers
//             .map(
//               (buttonNumber) => buildNumberButton(
//                 number: buttonNumber,
//                 onPressed: () {
//                   if (widget.controller.text.length < widget.maxLength) {
//                     setState(() {
//                       widget.controller.text =
//                           widget.controller.text + buttonNumber.toString();
//                     });
//                   }
//                   widget.onChanged?.call(widget.controller.text);
//                   if (widget.controller.text.length >= widget.maxLength) {
//                     widget.onCompleted?.call(widget.controller.text);
//                   }
//                 },
//               ),
//             )
//             .toList();
//     return Expanded(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         spacing: 4,
//         children: buttonList,
//       ),
//     );
//   }

//   Widget buildSpecialRow() {
//     return Expanded(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           widget.specialKey ??
//               IconButton(
//                 key: const Key('specialKey'),
//                 onPressed: () {
//                   widget.ShowSpecialKey == true
//                       ? widget.specialKeyOnTap?.call() ??
//                           () {
//                             if (widget.controller.text.length <
//                                 widget.maxLength) {
//                               if (!widget.controller.text.contains(".")) {
//                                 widget.controller.text =
//                                     widget.controller.text + ".";
//                               }
//                             }
//                             widget.onChanged?.call(widget.controller.text);
//                             if (widget.controller.text.length >=
//                                 widget.maxLength) {
//                               widget.onCompleted?.call(widget.controller.text);
//                             }
//                           }
//                       : null;
//                 },
//                 icon: SvgPicture.asset(
//                   Platform.isIOS ? SvgIcons.faceAuth1 : SvgIcons.printAuth,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//           buildNumberButton(
//             number: 0,
//             onPressed: () {
//               if (widget.controller.text.length < widget.maxLength) {
//                 widget.controller.text = widget.controller.text + 0.toString();
//               }
//               widget.onChanged?.call(widget.controller.text);
//               if (widget.controller.text.length >= widget.maxLength) {
//                 widget.onCompleted?.call(widget.controller.text);
//               }
//             },
//           ),
//           buildNumberButton(
//             icon: Icon(
//               Icons.backspace,
//               key: const Key('backspace'),
//               color: widget.pinTheme,
//             ),
//             onPressed: () {
//               if (widget.controller.text.isNotEmpty) {
//                 widget.controller.text = widget.controller.text.substring(
//                   0,
//                   widget.controller.text.length - 1,
//                 );
//               }
//               widget.onChanged?.call(widget.controller.text);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       spacing: 4,
//       children: [
//         buildNumberRow([1, 2, 3]),
//         buildNumberRow([4, 5, 6]),
//         buildNumberRow([7, 8, 9]),
//         buildSpecialRow(),
//       ],
//     );
//   }
// }
