// import 'package:prodev/core/utils/import.dart';
// import 'package:prodev/core/utils/spacer.dart';
// import 'package:prodev/core/widgets/extended_image.dart';
// import 'package:prodev/resources/colors.dart';

// class AppProduct extends StatelessWidget {
//   const AppProduct({
//     super.key,
//     this.layer1,
//     this.layer2,
//     this.layer3,
//     this.layer4,
//     this.imageUrl = '',
//     this.sp1 = 21,
//     this.sp2 = 21,
//     this.sp3 = 21,
//     this.sp4 = 21,
//   });
//   final Widget? layer1, layer2, layer3, layer4;
//   final double sp1, sp2, sp3, sp4;
//   final String imageUrl;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(32),
//         color: AppColors.white,
//         boxShadow: [
//           BoxShadow(
//             offset: Offset(0, 4),
//             blurRadius: 60,
//             spreadRadius: 0,
//             color: AppColors.customColor35.withOpacity(0.05),
//           ),
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             height: 120,
//             width: 120,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12),
//               color: AppColors.customColor26.withOpacity(0.2),
//             ),
//             child: ExtendedImageWidget.network(imageUrl),
//           ),
//           XMargin(16),
//           Expanded(
//             child: Column(
//               children: [
//                 if (layer1 != null) ...[
//                   layer1 ?? SizedBox.shrink(),
//                   YMargin(sp1),
//                 ],
//                 if (layer2 != null) ...[
//                   layer2 ?? SizedBox.shrink(),
//                   YMargin(sp2),
//                 ],
//                 if (layer3 != null) ...[
//                   layer3 ?? SizedBox.shrink(),
//                   YMargin(sp3),
//                 ],
//                 if (layer4 != null) ...[
//                   layer4 ?? SizedBox.shrink(),
//                   YMargin(sp4),
//                 ],
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
