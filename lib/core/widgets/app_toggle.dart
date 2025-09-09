// import 'package:flutter/material.dart';
// import 'package:coin_market/resources/colors.dart';

// class AppToggle extends StatefulWidget {
//   final Function(int) callback;
//   final List<String> tabTexts;
//   final int initialIndex;

//   const AppToggle({
//     Key? key,
//     required this.callback,
//     required this.tabTexts,
//     this.initialIndex = 0,
//   }) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _AppToggleState();
// }

// class _AppToggleState extends State<AppToggle> {
//   late int index;

//   _AppToggleState() : super();

//   @override
//   void initState() {
//     super.initState();

//     index = widget.initialIndex;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.of(context).size.width;
//     return Container(
//       height: 40,
//       width: width,
//       decoration: BoxDecoration(
//         color: AppColors.customColor48,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Stack(
//         children: [
//           AnimatedAlign(
//             alignment: Alignment(
//               (index / (widget.tabTexts.length - 1) * (2 - 2 * 0)) - 1 + 0,
//               0,
//             ),
//             duration: Duration(milliseconds: 150),
//             child: Container(
//               width: (width / widget.tabTexts.length) * 0.9,
//               height: 40 * 0.9,
//               decoration: BoxDecoration(
//                 boxShadow: [
//                   BoxShadow(
//                     color: AppColors.customColor24.withOpacity(0.03),
//                     spreadRadius: 0,
//                     blurRadius: 4,
//                     offset: const Offset(0, 2),
//                   ),
//                   BoxShadow(
//                     color: AppColors.customColor24.withOpacity(0.06),
//                     spreadRadius: 0,
//                     blurRadius: 10,
//                     offset: const Offset(0, 6),
//                   ),
//                 ],
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.circular(11),
//               ),
//             ),
//           ),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               for (int i = 0; i < widget.tabTexts.length; i++)
//                 _buildSwitchTab(
//                   i == index,
//                   widget.tabTexts[i],
//                   TextStyle(
//                     fontSize: 14,
//                     color:
//                         i == index
//                             ? AppColors.customColor24
//                             : AppColors.customColor11,
//                     fontWeight: FontWeight.w400,
//                   ),
//                   i,
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   /// building and returning one item of the tab
//   Widget _buildSwitchTab(bool isLeft, String title, TextStyle style, int i) {
//     return GestureDetector(
//       behavior: HitTestBehavior.translucent,
//       onTap: () {
//         setState(() {
//           index = i;
//           widget.callback(i);
//         });
//       },
//       child: Container(
//         alignment: Alignment.center,
//         width:
//             (MediaQuery.of(context).size.width - 70) / widget.tabTexts.length,
//         height: 40,
//         child: Text(title, textAlign: TextAlign.center, style: style),
//       ),
//     );
//   }
// }
