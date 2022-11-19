import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/color_data.dart';
import '../../../Constants/constant.dart';
import '../../../Constants/widget_utils.dart';
import '../../../dialog/logout_dialog.dart';
import '../../../dialog/rate_us_dialog.dart';
import '../../../routes/app_routes.dart';

class TabProfile extends StatefulWidget {
  const TabProfile({Key? key}) : super(key: key);

  @override
  State<TabProfile> createState() => _TabProfileState();
}

class _TabProfileState extends State<TabProfile> {
  void backClick() {
    Constant.backToPrev(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        getVerSpace(20.h),
        getToolBar("My Profile", () {
          backClick();
        }),
        getVerSpace(20.h),
        Expanded(
            flex: 1,
            child: ListView(
              children: [
                getAssetImage("profile_image.png", width: 100.h, height: 100.h),
                getVerSpace(12.h),
                getCustomFont("Leslie Alexander", 18.sp, Colors.black, 1,
                    fontWeight: FontWeight.w500, txtHeight: 1.66, textAlign: TextAlign.center),
                getVerSpace(2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getCustomFont("Edit Profile", 15.sp, Colors.black, 1,
                        fontWeight: FontWeight.w400, txtHeight: 1.53.h),
                    getHorSpace(4.h),
                    GestureDetector(
                        onTap: () {
                          Constant.sendToNext(context, Routes.editProfileRoute);
                        },
                        child: getSvgImage("edit-2.svg", width: 16.h, height: 16.h))
                  ],
                ),
                getVerSpace(20.h),
                getProfileWidget("My Certifications", () {
                  Constant.sendToNext(context, Routes.certificationRoute);
                }, "award.svg"),
                getVerSpace(20.h),
                getProfileWidget("My Projects", () {}, "book.svg"),
                getVerSpace(20.h),
                getProfileWidget("Saved Course", () {
                  Constant.sendToNext(context, Routes.savedCourseRoute);
                }, "frame.svg"),
                getVerSpace(20.h),
                getProfileWidget("My Card", () {
                  Constant.sendToNext(context, Routes.cardScreenRoute);
                }, "card.svg"),
                getVerSpace(20.h),
                getProfileWidget("Help Center", () {
                  Constant.sendToNext(context, Routes.helpCenterRoute);
                }, "info-circle.svg"),
                getVerSpace(20.h),
                getProfileWidget("Privacy Policy", () {
                  Constant.sendToNext(context, Routes.privacyPolicyRoute);
                }, "lock.svg"),
                getVerSpace(20.h),
                getProfileWidget("Feedback", () {
                  Constant.sendToNext(context, Routes.feedbackRoute);
                }, "like.svg"),
                getVerSpace(20.h),
                getProfileWidget("Rate Us", () {
                  showDialog(
                      builder: (context) {
                        return const RateUsDialog();
                      },
                      context: context);
                }, "heart.svg"),
                getVerSpace(30.h),
                getPaddingWidget(
                  EdgeInsets.symmetric(horizontal: 20.h),
                  getButton(context, Colors.white, "Logout", accentColor, () {
                    showDialog(
                        builder: (context) {
                          return const LogoutDialog();
                        },
                        context: context);
                  }, 18.sp,
                      weight: FontWeight.bold,
                      borderRadius: BorderRadius.circular(22.h),
                      buttonHeight: 56.h,
                      isBorder: true,
                      borderColor: accentColor,
                      borderWidth: 1.h),
                ),
                getVerSpace(40.h),
              ],
            ))
      ],
    );
  }

  Widget getProfileWidget(String title, Function function, String image) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.h),
        padding: EdgeInsets.all(18.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22.h),
            boxShadow: [
              BoxShadow(color: "#2423408F".toColor(), blurRadius: 16.h, offset: const Offset(-4, 5))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                getSvgImage(image, height: 24.h, width: 24.h),
                getHorSpace(18.h),
                getCustomFont(title, 15.sp, Colors.black, 1,
                    fontWeight: FontWeight.w700, txtHeight: 1.53.h)
              ],
            ),
            getSvgImage("arrow_right.svg", height: 24.h, width: 24.h),
          ],
        ),
      ),
    );
  }
}
