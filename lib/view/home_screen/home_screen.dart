import 'package:education_app/view/home_screen/tab/tab_course.dart';
import 'package:education_app/view/home_screen/tab/tab_home.dart';
import 'package:education_app/view/home_screen/tab/tab_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/color_data.dart';
import '../../Constants/constant.dart';
import '../../Constants/widget_utils.dart';
import '../../controller/controller.dart';
import '../../data/data_file.dart';
import '../../model/model_bottom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void backClick() {
    Constant.closeApp();
  }

  HomeController controller = Get.put(HomeController());
  static final List<Widget> _widgetOptions = <Widget>[
    const TabHome(),
    const TabCourse(),
    const TabCourse(),
    // const TabChat(),
    const TabProfile()
  ];
  List<ModelBottom> bottomLists = DataFile.bottomList;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (controller.index.value != 0) {
          controller.onChange(0.obs);
        } else {
          backClick();
        }
        return false;
      },
      child: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) => Stack(
          alignment: Alignment.bottomRight,
          children: [
            Scaffold(
              backgroundColor: Colors.white,
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: buildBottomNavigation(controller),
              body: SafeArea(
                child: GetX<HomeController>(
                  init: HomeController(),
                  builder: (controller) => _widgetOptions[controller.index.value],
                ),
              ),
            ),
            Positioned(
                bottom: 110.h,
                right: 20.h,
                child: controller.index.value == 2
                    ? Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: BoxDecoration(
                            color: accentColor, borderRadius: BorderRadius.circular(40.h)),
                        padding: EdgeInsets.all(13.h),
                        child: getSvgImage("edit.svg", width: 24.h, height: 24.h),
                      )
                    : Container())
          ],
        ),
      ),
    );
  }

  Container buildBottomNavigation(HomeController controller) {
    return Container(
      height: 70.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(22.h)),
          boxShadow: [
            BoxShadow(color: bottomSahdowColor, offset: const Offset(4, 0), blurRadius: 20.h)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(bottomLists.length, (index) {
          ModelBottom modelBottom = bottomLists[index];
          return GestureDetector(
            onTap: () {
              controller.onChange(index.obs);
            },
            child: Container(
              color: Colors.transparent,
              height: 70.h,
              width: 70.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  getSvgImage(
                      controller.index.value == index
                          ? modelBottom.select ?? ""
                          : modelBottom.unselect ?? "",
                      height: 24.h,
                      width: 24.h),
                  getVerSpace(9.h),
                  controller.index.value == index
                      ? Container(
                          height: 1.75.h,
                          width: 24.h,
                          color: accentColor,
                        )
                      : const SizedBox()
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
