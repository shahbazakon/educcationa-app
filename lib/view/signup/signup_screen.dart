import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/color_data.dart';
import '../../Constants/constant.dart';
import '../../Constants/widget_utils.dart';
import '../../controller/controller.dart';
import '../../routes/app_routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  SignUpController controller = Get.put(SignUpController());

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
                        getCustomFont("Create an account", 24.sp, Colors.black, 1,
                            fontWeight: FontWeight.w700, textAlign: TextAlign.center),
                        getVerSpace(20.h),
                        getDefaultTextFiledWithLabel(
                          context,
                          "Name",
                          controller.nameController,
                          isEnable: false,
                          height: 60.h,
                        ),
                        getVerSpace(20.h),
                        getDefaultTextFiledWithLabel(
                          context,
                          "Email",
                          controller.emailController,
                          isEnable: false,
                          height: 60.h,
                        ),
                        getVerSpace(20.h),
                        getDefaultTextFiledWithLabel(
                          context,
                          "Password",
                          controller.passwordController,
                          isEnable: false,
                          height: 60.h,
                        ),
                        getVerSpace(20.h),
                        getDefaultTextFiledWithLabel(
                          context,
                          "Confirm password",
                          controller.confirmPasswordController,
                          isEnable: false,
                          height: 60.h,
                        ),
                        getVerSpace(20.h),
                        Row(
                          children: [
                            GetX<SignUpController>(
                              init: SignUpController(),
                              builder: (controller) => GestureDetector(
                                child: controller.check.value == true
                                    ? getSvgImage("check.svg", width: 17.6.h, height: 17.6.h)
                                    : Container(
                                        height: 17.6.h,
                                        width: 17.6.h,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(color: borderColor, width: 1.h),
                                            borderRadius: BorderRadius.circular(2.h)),
                                      ),
                                onTap: () {
                                  controller.onCheck();
                                },
                              ),
                            ),
                            getHorSpace(10.h),
                            GestureDetector(
                              onTap: () {
                                Constant.sendToNext(context, Routes.termConditionRoute);
                              },
                              child: getRichText(
                                  "I Agree with ",
                                  Colors.black,
                                  FontWeight.w400,
                                  15.sp,
                                  "Terms and  condition",
                                  accentColor,
                                  FontWeight.w700,
                                  20.sp),
                            )
                          ],
                        ),
                        getVerSpace(30.h),
                        getButton(context, accentColor, "Sign Up", Colors.white, () {
                          Constant.sendToNext(context, Routes.phoneNumberScreenRoute);
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
                    child: getRichText("Already have an account? ", Colors.black, FontWeight.w400,
                        15.sp, "Login", Colors.black, FontWeight.w700, 18.sp,
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
