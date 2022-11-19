import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/color_data.dart';
import '../../Constants/constant.dart';
import '../../Constants/widget_utils.dart';
import '../../controller/controller.dart';
import '../../routes/app_routes.dart';

class PhoneNumberScreen extends StatefulWidget {
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  State<PhoneNumberScreen> createState() => _PhoneNumberScreenState();
}

class _PhoneNumberScreenState extends State<PhoneNumberScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  ForgotController controller = Get.put(ForgotController());

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
                        getCustomFont("Enter your phone number", 24.sp, Colors.black, 1,
                            fontWeight: FontWeight.w700, textAlign: TextAlign.center),
                        getVerSpace(16.h),
                        getMultilineCustomFont(
                            "You will receive 4 digits number to verified number",
                            15.sp,
                            Colors.black,
                            fontWeight: FontWeight.w400,
                            textAlign: TextAlign.center,
                            txtHeight: 1.46.h),
                        getVerSpace(22.h),
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
                        getVerSpace(30.h),
                        getButton(context, accentColor, "Continue", Colors.white, () {
                          Constant.sendToNext(context, Routes.verificationRoute);
                        }, 18.sp,
                            buttonHeight: 56.h,
                            borderRadius: BorderRadius.circular(22.h),
                            weight: FontWeight.w700)
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
