import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/color_data.dart';
import '../../Constants/constant.dart';
import '../../Constants/widget_utils.dart';
import '../../controller/controller.dart';
import '../../dialog/change_password_dialog.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  ResetController controller = Get.put(ResetController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        backClick();
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                        getCustomFont("Reset Password", 24.sp, Colors.black, 1,
                            fontWeight: FontWeight.w700, textAlign: TextAlign.center),
                        getVerSpace(16.h),
                        getMultilineCustomFont(
                            "Enter password which are different from the previous paswords.",
                            15.sp,
                            Colors.black,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.center,
                            txtHeight: 1.46.h),
                        getVerSpace(22.h),
                        getDefaultTextFiledWithLabel(
                            context, "Password", controller.passwordController,
                            isEnable: false, suffiximage: "eye.svg", withSufix: true, isPass: true),
                        getVerSpace(20.h),
                        getDefaultTextFiledWithLabel(
                            context, "Confirm password", controller.confirmPasswordController,
                            isEnable: false, suffiximage: "eye.svg", withSufix: true, isPass: true),
                        getVerSpace(30.h),
                        getButton(context, accentColor, "Done", Colors.white, () {
                          showDialog(
                              builder: (context) {
                                return const ChangePasswordDialog();
                              },
                              context: context);
                        }, 18.sp,
                            buttonHeight: 56.h,
                            borderRadius: BorderRadius.circular(22.h),
                            weight: FontWeight.w700)
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
