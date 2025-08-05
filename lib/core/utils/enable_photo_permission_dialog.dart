import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prodev/core/utils/spacer.dart';
import 'package:prodev/core/widgets/buttons.dart';
import 'package:prodev/resources/colors.dart';

class EnablePhotoPermissionDialog extends StatelessWidget {
  const EnablePhotoPermissionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Permission Required",
          style: TextStyle(
            color: AppColors.neutral800,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        YMargin(16),
        Text(
          "To save images, please enable photo access in settings.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.grey,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        YMargin(16),
        CustomElevatedButton(
          text: "Open Settings",
          buttonColor: AppColors.neutral400,
          onPressed: () async {
            await openAppSettings(); // Opens settings
          },
        ),
      ],
    );
  }
}
