import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/color_data.dart';
import '../Constants/constant.dart';
import '../Constants/widget_utils.dart';
import '../routes/app_routes.dart';

class PaymentSuccessDialog extends StatefulWidget {
  const PaymentSuccessDialog({Key? key}) : super(key: key);

  @override
  State<PaymentSuccessDialog> createState() => _PaymentSuccessDialogState();
}

class _PaymentSuccessDialogState extends State<PaymentSuccessDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.h)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.h),
      child: getPaddingWidget(
        EdgeInsets.symmetric(horizontal: 30.h),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            getVerSpace(50.h),
            getAssetImage("checked.png", width: 120.h, height: 120.h),
            getVerSpace(30.h),
            getCustomFont("Payment Successfull", 28.sp, Colors.black, 1,
                fontWeight: FontWeight.w700, txtHeight: 1.21.h),
            getVerSpace(12.h),
            getMultilineCustomFont(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit", 15.sp, jetColor,
                txtHeight: 1.53.h, fontWeight: FontWeight.w400, textAlign: TextAlign.center),
            getVerSpace(40.h),
            getButton(context, accentColor, "Back To Home", Colors.white, () {
              Constant.sendToNext(context, Routes.homeScreenRoute);
            }, 18.sp,
                weight: FontWeight.w700,
                buttonHeight: 56.h,
                borderRadius: BorderRadius.circular(22.h)),
            getVerSpace(50.h),
          ],
        ),
      ),
    );
  }
}
