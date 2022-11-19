import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/color_data.dart';
import '../../Constants/constant.dart';
import '../../Constants/pref_data.dart';
import '../../Constants/widget_utils.dart';
import '../../controller/controller.dart';
import '../../routes/app_routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void backClick() {
    Constant.closeApp();
  }

  LoginController controller = Get.put(LoginController());

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
                    child: ListView(
                  children: [
                    getVerSpace(20.h),
                    getCustomFont("Login", 24.sp, Colors.black, 1,
                        fontWeight: FontWeight.w700, textAlign: TextAlign.center),
                    getVerSpace(16.h),
                    getMultilineCustomFont("Glad to meet you again! ", 15.sp, Colors.black,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                        txtHeight: 1.46.h),
                    getVerSpace(21.h),
                    getDefaultTextFiledWithLabel(
                      context,
                      "Email",
                      controller.emailController,
                      isEnable: false,
                      height: 60.h,
                    ),
                    getVerSpace(20.h),
                    getDefaultTextFiledWithLabel(context, "Password", controller.passwordController,
                        isEnable: false, suffiximage: "eye.svg", withSufix: true, isPass: true),
                    getVerSpace(21.h),
                    GestureDetector(
                      onTap: () {
                        Constant.sendToNext(context, Routes.forgotScreenRoute);
                      },
                      child: getCustomFont("Forgot password ?", 15.sp, accentColor, 1,
                          fontWeight: FontWeight.w700, textAlign: TextAlign.end),
                    ),
                    getVerSpace(40.h),
                    getButton(
                      context,
                      accentColor,
                      "Log In",
                      Colors.white,
                      () {
                        PrefData.setIsSignIn(true);
                        Constant.sendToNext(context, Routes.homeScreenRoute);
                      },
                      18.sp,
                      weight: FontWeight.w700,
                      buttonHeight: 56.h,
                      borderRadius: BorderRadius.circular(22.h),
                    ),
                    getVerSpace(40.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Divider(
                            color: borderColor,
                            thickness: 1.h,
                            height: 1.h,
                          ),
                        ),
                        getCustomFont("OR Sign in with", 15.sp, Colors.black, 1,
                            fontWeight: FontWeight.w400, textAlign: TextAlign.center),
                        Expanded(
                          flex: 1,
                          child: Divider(
                            color: borderColor,
                            thickness: 1.h,
                            height: 1.h,
                          ),
                        ),
                      ],
                    ),
                    getVerSpace(41.h),
                    getButton(
                        context, greyScaleColor, "Login with Google", Colors.black, () {}, 18.sp,
                        weight: FontWeight.w500,
                        buttonHeight: 56.h,
                        borderRadius: BorderRadius.circular(12.h),
                        isIcon: true,
                        image: "google.svg"),
                    getVerSpace(20.h),
                    getButton(
                        context, greyScaleColor, "Login with Facebook", Colors.black, () {}, 18.sp,
                        weight: FontWeight.w500,
                        buttonHeight: 56.h,
                        borderRadius: BorderRadius.circular(12.h),
                        isIcon: true,
                        image: "facebook.svg")
                  ],
                )),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Constant.sendToNext(context, Routes.signUpScreenRoute);
                    },
                    child: getRichText("Already have an account? ", Colors.black, FontWeight.w400,
                        15.sp, "Sign up", Colors.black, FontWeight.w700, 18.sp,
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
