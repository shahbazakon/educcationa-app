import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/color_data.dart';
import '../Constants/constant.dart';
import '../Constants/widget_utils.dart';
import '../routes/app_routes.dart';

class ChangePasswordDialog extends StatefulWidget {
  const ChangePasswordDialog({Key? key}) : super(key: key);

  @override
  State<ChangePasswordDialog> createState() => _ChangePasswordDialogState();
}

class _ChangePasswordDialogState extends State<ChangePasswordDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.h),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.h),
      child: getPaddingWidget(
        EdgeInsets.symmetric(horizontal: 20.h),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            getVerSpace(39.5.h),
            getAssetImage("change_icon.png", height: 90.h, width: 77.h),
            getVerSpace(30.h),
            getCustomFont("Changed !", 22.sp, Colors.black, 1,
                fontWeight: FontWeight.w700, textAlign: TextAlign.center),
            getVerSpace(20.h),
            getMultilineCustomFont(
                "Your password has been changed sucessfully !", 15.sp, Colors.black,
                fontWeight: FontWeight.w700, textAlign: TextAlign.center, txtHeight: 1.46.h),
            getVerSpace(32.h),
            getButton(context, accentColor, "Ok", Colors.white, () {
              Constant.sendToNext(context, Routes.loginScreenRoute);
            }, 18.sp,
                weight: FontWeight.w700,
                buttonHeight: 56.h,
                borderRadius: BorderRadius.circular(22.h)),
            getVerSpace(39.5.h),
          ],
        ),
      ),
    );
  }
}
