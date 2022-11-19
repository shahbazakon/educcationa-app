import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/color_data.dart';
import '../Constants/constant.dart';
import '../Constants/pref_data.dart';
import '../Constants/widget_utils.dart';
import '../routes/app_routes.dart';

class LogoutDialog extends StatefulWidget {
  const LogoutDialog({Key? key}) : super(key: key);

  @override
  State<LogoutDialog> createState() => _LogoutDialogState();
}

class _LogoutDialogState extends State<LogoutDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.h)),
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.h),
      child: getPaddingWidget(
        EdgeInsets.symmetric(horizontal: 20.h),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getVerSpace(40.h),
            getMultilineCustomFont("Are you sure you want to Logout! ", 24.sp, Colors.black,
                fontWeight: FontWeight.w700, txtHeight: 1.5.h, textAlign: TextAlign.center),
            getVerSpace(31.h),
            Row(
              children: [
                Expanded(
                    child: getButton(context, accentColor, "Yes", Colors.white, () {
                  PrefData.setIsSignIn(false);
                  Constant.sendToNext(context, Routes.loginScreenRoute);
                }, 18.sp,
                        weight: FontWeight.w700,
                        buttonHeight: 56.h,
                        borderRadius: BorderRadius.circular(22.h))),
                getHorSpace(18.h),
                Expanded(
                    child: getButton(context, Colors.white, "No", accentColor, () {
                  Constant.backToPrev(context);
                }, 18.sp,
                        weight: FontWeight.w700,
                        buttonHeight: 56.h,
                        borderRadius: BorderRadius.circular(22.h),
                        isBorder: true,
                        borderColor: accentColor,
                        borderWidth: 1.h)),
              ],
            ),
            getVerSpace(40.h)
          ],
        ),
      ),
    );
  }
}
