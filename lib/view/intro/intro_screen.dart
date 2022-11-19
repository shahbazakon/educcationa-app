import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/color_data.dart';
import '../../Constants/constant.dart';
import '../../Constants/pref_data.dart';
import '../../Constants/widget_utils.dart';
import '../../controller/controller.dart';
import '../../data/data_file.dart';
import '../../model/model_intro.dart';
import '../../routes/app_routes.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  void backClick() {
    Constant.closeApp();
  }

  IntroController controller = Get.put(IntroController());
  List<ModelIntro> introLists = DataFile.introList;

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
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: GetBuilder<IntroController>(
              init: IntroController(),
              builder: (controller) => Stack(
                children: [
                  Column(
                    children: [
                      Expanded(child: Container()),
                      Container(
                        height: 342.h,
                        color: Colors.white,
                      )
                    ],
                  ),
                  PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: controller.pageController,
                    onPageChanged: (value) {
                      controller.selectedPage.value = value;
                      controller.change(value.obs);
                    },
                    itemCount: introLists.length,
                    itemBuilder: (context, index) {
                      ModelIntro modalIntro = introLists[index];

                      return Column(
                        children: [
                          Expanded(
                              child: Container(
                            child: getAssetImage(modalIntro.image ?? "",
                                height: 476.h, width: double.infinity, boxFit: BoxFit.fill),
                          )),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            height: 342.h,
                            child: Column(
                              children: [
                                getVerSpace(50.h),
                                getCustomFont(modalIntro.title ?? "", 22.sp, Colors.black, 1,
                                    fontWeight: FontWeight.w700, textAlign: TextAlign.center),
                                getVerSpace(20.h),
                                getMultilineCustomFont(
                                    "We provide the best  learning couerses & great mentors for you.",
                                    15.sp,
                                    Colors.black,
                                    fontWeight: FontWeight.w700,
                                    textAlign: TextAlign.center)
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Column(
                        children: [
                          getVerSpace(16.h),
                          getPaddingWidget(
                            EdgeInsets.symmetric(horizontal: 20.h),
                            Align(
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  PrefData.setIsIntro(false);
                                  Get.toNamed(Routes.loginScreenRoute);
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 17.5.h, vertical: 4.h),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.h)),
                                  child: getCustomFont("Skip", 16, Colors.black, 1,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        getPaddingWidget(
                          EdgeInsets.symmetric(horizontal: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  introLists.length,
                                  (position) {
                                    return getPaddingWidget(
                                        EdgeInsets.only(left: position == 0 ? 0 : 6.h, right: 6.h),
                                        getSvgImage(position == controller.select.value
                                            ? "select_dot.svg"
                                            : "dot.svg"));
                                  },
                                ),
                              ),
                              getButton(
                                  context,
                                  accentColor,
                                  controller.select.value == 3 ? "Get Started" : "Next",
                                  Colors.white, () {
                                if (controller.select.value <= 2) {
                                  controller.change(controller.select.value.obs + 1);
                                } else {
                                  PrefData.setIsIntro(false);
                                  Get.toNamed(Routes.loginScreenRoute);
                                }
                                controller.pageController.animateToPage(controller.select.value,
                                    duration: const Duration(milliseconds: 250),
                                    curve: Curves.easeInSine);
                              }, 18.sp,
                                  weight: FontWeight.w700,
                                  borderRadius: BorderRadius.circular(22.h),
                                  buttonHeight: 56.h,
                                  buttonWidth: 177.w)
                            ],
                          ),
                        ),
                        getVerSpace(30.h)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
