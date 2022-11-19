import 'package:education_app/Constants/color_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/constant.dart';
import '../../Constants/widget_utils.dart';
import '../../controller/controller.dart';
import '../../routes/app_routes.dart';

class ChoosePlan extends StatefulWidget {
  const ChoosePlan({Key? key}) : super(key: key);

  @override
  State<ChoosePlan> createState() => _ChoosePlanState();
}

class _ChoosePlanState extends State<ChoosePlan> {
  void backClick() {
    Constant.backToPrev(context);
  }

  ChoosePlanController controller = Get.put(ChoosePlanController());

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
            children: [
              getVerSpace(20.h),
              getToolBar("Choose Your Plan", () {
                backClick();
              }),
              getVerSpace(20.h),
              Expanded(
                  flex: 1,
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.onChange(0.obs);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22.h),
                              boxShadow: [
                                BoxShadow(
                                    color: "#2423408F".toColor(),
                                    offset: const Offset(-4, 5),
                                    blurRadius: 16.h)
                              ]),
                          margin: EdgeInsets.symmetric(horizontal: 20.h),
                          padding: EdgeInsets.all(20.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  getCustomFont("\$12/Month", 20.sp, Colors.black, 1,
                                      fontWeight: FontWeight.w700, txtHeight: 1.2.h),
                                  GetBuilder<ChoosePlanController>(
                                    init: ChoosePlanController(),
                                    builder: (controller) => getSvgImage(
                                        controller.select.value == 0 ? "radio.svg" : "unradio.svg",
                                        width: 24.h,
                                        height: 24.h),
                                  )
                                ],
                              ),
                              getVerSpace(12.h),
                              Row(
                                children: [
                                  getSvgImage("done.svg", height: 16.h, width: 16.h),
                                  getHorSpace(12.h),
                                  getCustomFont(
                                      "Lorem ipsum dolor sit amet", 15.sp, Colors.black, 1,
                                      fontWeight: FontWeight.w400, txtHeight: 1.53.h)
                                ],
                              ),
                              getVerSpace(12.h),
                              Row(
                                children: [
                                  getSvgImage("done.svg", height: 16.h, width: 16.h),
                                  getHorSpace(12.h),
                                  getCustomFont(
                                      "Lorem ipsum dolor sit amet", 15.sp, Colors.black, 1,
                                      fontWeight: FontWeight.w400, txtHeight: 1.53.h)
                                ],
                              ),
                              getVerSpace(12.h),
                              Row(
                                children: [
                                  getSvgImage("done.svg", height: 16.h, width: 16.h),
                                  getHorSpace(12.h),
                                  getCustomFont(
                                      "Lorem ipsum dolor sit amet", 15.sp, Colors.black, 1,
                                      fontWeight: FontWeight.w400, txtHeight: 1.53.h)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      getVerSpace(30.h),
                      GestureDetector(
                        onTap: () {
                          controller.onChange(1.obs);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22.h),
                              boxShadow: [
                                BoxShadow(
                                    color: "#2423408F".toColor(),
                                    offset: const Offset(-4, 5),
                                    blurRadius: 16.h)
                              ]),
                          margin: EdgeInsets.symmetric(horizontal: 20.h),
                          padding: EdgeInsets.all(20.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  getCustomFont("\$99/Year", 20.sp, Colors.black, 1,
                                      fontWeight: FontWeight.w700, txtHeight: 1.2.h),
                                  GetBuilder<ChoosePlanController>(
                                    init: ChoosePlanController(),
                                    builder: (controller) => getSvgImage(
                                        controller.select.value == 1 ? "radio.svg" : "unradio.svg",
                                        width: 24.h,
                                        height: 24.h),
                                  )
                                ],
                              ),
                              getVerSpace(12.h),
                              Row(
                                children: [
                                  getSvgImage("done.svg", height: 16.h, width: 16.h),
                                  getHorSpace(12.h),
                                  getCustomFont(
                                      "Lorem ipsum dolor sit amet", 15.sp, Colors.black, 1,
                                      fontWeight: FontWeight.w400, txtHeight: 1.53.h)
                                ],
                              ),
                              getVerSpace(12.h),
                              Row(
                                children: [
                                  getSvgImage("done.svg", height: 16.h, width: 16.h),
                                  getHorSpace(12.h),
                                  getCustomFont(
                                      "Lorem ipsum dolor sit amet", 15.sp, Colors.black, 1,
                                      fontWeight: FontWeight.w400, txtHeight: 1.53.h)
                                ],
                              ),
                              getVerSpace(12.h),
                              Row(
                                children: [
                                  getSvgImage("done.svg", height: 16.h, width: 16.h),
                                  getHorSpace(12.h),
                                  getCustomFont(
                                      "Lorem ipsum dolor sit amet", 15.sp, Colors.black, 1,
                                      fontWeight: FontWeight.w400, txtHeight: 1.53.h)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              getPaddingWidget(
                EdgeInsets.symmetric(horizontal: 20.h),
                getButton(context, accentColor, "Payment", Colors.white, () {
                  Constant.sendToNext(context, Routes.paymentRoute);
                }, 18.sp,
                    weight: FontWeight.w700,
                    buttonHeight: 56.h,
                    borderRadius: BorderRadius.circular(22.h)),
              ),
              getVerSpace(30.h)
            ],
          ),
        ),
      ),
    );
  }
}
