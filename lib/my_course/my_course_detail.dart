import 'package:education_app/Constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/model_course.dart';
import '../Constants/color_data.dart';
import '../Constants/widget_utils.dart';
import '../data/data_file.dart';
import '../dialog/course_complete_dialog.dart';
import '../model/model_sub_course.dart';
import '../routes/app_routes.dart';

class MyCourseDetail extends StatefulWidget {
  const MyCourseDetail({Key? key}) : super(key: key);

  @override
  State<MyCourseDetail> createState() => _MyCourseDetailState();
}

class _MyCourseDetailState extends State<MyCourseDetail> {
  void backClick() {
    Constant.backToPrev(context);
  }

  List<ModelCourse> myCourseLists = DataFile.courseList;

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
              getToolBar("UI/UX Design", () {
                backClick();
              }),
              getVerSpace(20.h),
              Expanded(
                  flex: 1,
                  child: ListView.builder(
                    primary: true,
                    shrinkWrap: true,
                    itemCount: myCourseLists.length,
                    itemBuilder: (context, index) {
                      ModelCourse modelCourse = myCourseLists[index];
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.h),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                getCustomFont(modelCourse.lessonName ?? "", 15.sp, subtextColor, 1,
                                    fontWeight: FontWeight.w700, txtHeight: 1.53.h),
                                Container(
                                  decoration: BoxDecoration(
                                    color: lightAccent,
                                    borderRadius: BorderRadius.circular(22.h),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 1.h),
                                  child: getCustomFont(
                                      modelCourse.time ?? '', 12.sp, accentColor, 1,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            getVerSpace(20.h),
                            ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: modelCourse.subCourseList!.length,
                              itemBuilder: (context, index) {
                                ModelSubCourse modelSubCourse = modelCourse.subCourseList![index];
                                return GestureDetector(
                                  onTap: () {
                                    Constant.sendToNext(context, Routes.videoScreenRoute);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(12.h),
                                    margin: EdgeInsets.only(bottom: 20.h),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(22.h),
                                        boxShadow: [
                                          BoxShadow(
                                              color: "#2423408F".toColor(),
                                              offset: const Offset(-4, 5),
                                              blurRadius: 16.h)
                                        ]),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 55.h,
                                                width: 33.h,
                                                decoration: BoxDecoration(
                                                    color: lightAccent,
                                                    borderRadius: BorderRadius.circular(22.h)),
                                                alignment: Alignment.center,
                                                child: getCustomFont(modelSubCourse.index ?? "",
                                                    15.sp, accentColor, 1,
                                                    fontWeight: FontWeight.w700),
                                              ),
                                              getHorSpace(12.h),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    getMultilineCustomFont(
                                                        modelSubCourse.name ?? '',
                                                        14.sp,
                                                        Colors.black,
                                                        fontWeight: FontWeight.w700,
                                                        txtHeight: 1.5.h,
                                                        textAlign: TextAlign.start),
                                                    getCustomFont("12 min", 14.sp, subtextColor, 1,
                                                        fontWeight: FontWeight.w500,
                                                        txtHeight: 1.5.h)
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        getSvgImage(modelSubCourse.image ?? '',
                                            width: 26.h, height: 26.h)
                                      ],
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    },
                  )),
              getPaddingWidget(
                EdgeInsets.symmetric(horizontal: 20.h),
                getButton(context, accentColor, "Continue Course", Colors.white, () {
                  showDialog(
                      builder: (context) {
                        return const CourseCompleteDialog();
                      },
                      context: context);
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
