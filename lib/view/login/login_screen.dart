import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // GestureDetector(
              //     onTap: () {
              //       backClick();
              //     },
              //     child: getSvgImage("arrow_left.svg", width: 24.h, height: 24.h)),
              SizedBox(height: MediaQuery.of(context).size.height * .06),
              Image.asset("assets/iqra_images/iqra_logo.jpg", height: 120.h),
              Container(
                height: MediaQuery.of(context).size.height * .65,
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(40), topLeft: Radius.circular(40))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getCustomFont("Login", 24.sp, Colors.black, 1,
                            fontWeight: FontWeight.w700, textAlign: TextAlign.center),
                        getVerSpace(10.h),
                        getMultilineCustomFont("Glad to meet you again! ", 15.sp, Colors.black,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.center,
                            txtHeight: 1.46.h),
                      ],
                    ),
                    Column(
                      children: [
                        GetBuilder<ForgotController>(
                          init: ForgotController(),
                          builder: (controller) => getDefaultTextFiledWithLabel(
                              context, "Phone Number", controller.phoneController,
                              isEnable: false,
                              height: 60.h,
                              isprefix: true,
                              prefix: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.selectCountryRoute);
                                },
                                child: Row(
                                  children: [
                                    getHorSpace(16.h),
                                    getAssetImage(controller.image.value),
                                    getHorSpace(10.h),
                                    getCustomFont(controller.code.value, 15.sp, greyColor, 1,
                                        fontWeight: FontWeight.w400),
                                    getHorSpace(10.h),
                                    getSvgImage("arrow_down.svg", width: 20.h, height: 20.h),
                                  ],
                                ),
                              ),
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                              ],
                              constraint: BoxConstraints(maxWidth: 140.h, maxHeight: 24.h),
                              keyboardType: TextInputType.number),
                        ),
                        getVerSpace(40.h),
                        getButton(
                          context,
                          accentColor,
                          "Get OTP",
                          Colors.white,
                          () {
                            PrefData.setIsSignIn(true);
                            Constant.sendToNext(context, Routes.verificationRoute);
                          },
                          18.sp,
                          weight: FontWeight.w700,
                          buttonHeight: 56.h,
                          borderRadius: BorderRadius.circular(22.h),
                        ),
                      ],
                    ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        getSvgImage("google.svg", height: 40.h),
                        getHorSpace(50.w),
                        getSvgImage("facebook.svg", height: 45.h)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
