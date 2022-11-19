import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/color_data.dart';
import '../Constants/constant.dart';
import '../Constants/pref_data.dart';
import '../Constants/widget_utils.dart';
import '../routes/app_routes.dart';

class SuccessVerificationDialog extends StatefulWidget {
  const SuccessVerificationDialog({Key? key}) : super(key: key);

  @override
  State<SuccessVerificationDialog> createState() => _SuccessVerificationDialogState();
}

class _SuccessVerificationDialogState extends State<SuccessVerificationDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.h),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.h),
      backgroundColor: Colors.white,
      child: getPaddingWidget(
        EdgeInsets.symmetric(horizontal: 20.h),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getVerSpace(39.5.h),
            getAssetImage("success.png", width: 78.h, height: 90.h),
            getVerSpace(30.h),
            getCustomFont("Sucessful !", 22.sp, Colors.black, 1,
                fontWeight: FontWeight.w700, textAlign: TextAlign.center),
            getVerSpace(20.h),
            getMultilineCustomFont(
                "Your password has been changed sucessfully !", 15.sp, Colors.black,
                fontWeight: FontWeight.w700, textAlign: TextAlign.center, txtHeight: 1.46.h),
            getVerSpace(32.h),
            getButton(context, accentColor, "Ok", Colors.white, () {
              PrefData.setIsSignIn(true);
              Constant.sendToNext(context, Routes.homeScreenRoute);
            }, 18.sp,
                weight: FontWeight.w700,
                buttonHeight: 56.h,
                borderRadius: BorderRadius.circular(22.h)),
            getVerSpace(39.5.h)
          ],
        ),
      ),
    );
  }
}
