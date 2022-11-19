// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../Constants/color_data.dart';
import '../../Constants/constant.dart';
import '../../Constants/widget_utils.dart';
import '../../dialog/success_verification_dialog.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        backClick();
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: getPaddingWidget(
            EdgeInsets.symmetric(horizontal: 20.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getVerSpace(16.h),
                GestureDetector(
                    onTap: () {
                      backClick();
                    },
                    child: getSvgImage("arrow_left.svg", width: 24.h, height: 24.h)),
                Expanded(
                    flex: 1,
                    child: ListView(
                      children: [
                        getVerSpace(20.h),
                        getCustomFont("Verification", 24.sp, Colors.black, 1,
                            fontWeight: FontWeight.w700, textAlign: TextAlign.center),
                        getVerSpace(20.h),
                        getMultilineCustomFont("We sent to the 99*******5", 15.sp, Colors.black,
                            fontWeight: FontWeight.w700,
                            textAlign: TextAlign.center,
                            txtHeight: 1.46.h),
                        getVerSpace(31.h),
                        Pinput(
                          focusedPinTheme: PinTheme(
                            decoration: BoxDecoration(
                              border: Border.all(color: accentColor, width: 1.h),
                              borderRadius: BorderRadius.circular(12.h),
                            ),
                            height: 68.h,
                            width: 79.h,
                            margin: EdgeInsets.symmetric(horizontal: 9.h),
                            textStyle: TextStyle(
                                fontSize: 24.h,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontFamily: Constant.fontsFamily),
                          ),
                          disabledPinTheme: PinTheme(
                            width: 79.h,
                            height: 68.h,
                            margin: EdgeInsets.symmetric(horizontal: 9.h),
                            textStyle: TextStyle(
                                fontSize: 24.h,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontFamily: Constant.fontsFamily),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: borderColor, width: 1.h),
                                borderRadius: BorderRadius.circular(12.h)),
                          ),
                          defaultPinTheme: PinTheme(
                            width: 79.h,
                            height: 68.h,
                            margin: EdgeInsets.symmetric(horizontal: 9.h),
                            textStyle: TextStyle(
                                fontSize: 24.h,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontFamily: Constant.fontsFamily),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: borderColor, width: 1.h),
                                borderRadius: BorderRadius.circular(12.h)),
                          ),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                          showCursor: true,
                          onCompleted: (pin) {},
                          length: 4,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                        getVerSpace(30.h),
                        getButton(context, accentColor, "Confirm", Colors.white, () {
                          showDialog(
                              builder: (context) {
                                return const SuccessVerificationDialog();
                              },
                              context: context);
                        }, 18.sp,
                            buttonHeight: 56.h,
                            borderRadius: BorderRadius.circular(22.h),
                            weight: FontWeight.w700)
                      ],
                    )),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      backClick();
                    },
                    child: getRichText("Don’t receive code? ", Colors.black, FontWeight.w400, 15.sp,
                        "Resend", Colors.black, FontWeight.w700, 18.sp,
                        textAlign: TextAlign.center),
                  ),
                ),
                getVerSpace(30.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
