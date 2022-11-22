import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/color_data.dart';
import '../../Constants/widget_utils.dart';
import '../../controller/controller.dart';
import '../../data/data_file.dart';
import '../../model/model_lesson.dart';
import '../../model/model_review.dart';

class TabLiveClasses extends StatefulWidget {
  const TabLiveClasses({Key? key}) : super(key: key);

  @override
  State<TabLiveClasses> createState() => _TabLiveClassesState();
}

class _TabLiveClassesState extends State<TabLiveClasses> {
  List<ModelReview> reviewLists = DataFile.reviewList;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LessonController>(
      init: LessonController(),
      builder: (controller) => ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        itemBuilder: (context, index) {
          ModelLesson modelLesson = controller.lessonLists[index];
          return Container(
            margin: EdgeInsets.only(bottom: 20.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22.h),
                boxShadow: [
                  BoxShadow(
                      color: "#2423408F".toColor(), blurRadius: 16.h, offset: const Offset(-4, 5))
                ]),
            child: ListTile(
              contentPadding: EdgeInsets.only(left: 5.h, right: 20.h),
              trailing: getSvgImage("video-circle.svg", width: 24.h, height: 24.h),
              title: Row(
                children: [
                  getAssetImage(modelLesson.image ?? "", height: 66.h, width: 66.h),
                  getHorSpace(12.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getCustomFont(modelLesson.name ?? "", 14.sp, Colors.black, 1,
                          fontWeight: FontWeight.w700, txtHeight: 1.5.h),
                      getVerSpace(4.h),
                      Container(
                        decoration: BoxDecoration(
                          color: lightAccent,
                          borderRadius: BorderRadius.circular(22.h),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 1.h),
                        child: getCustomFont(modelLesson.lessson ?? "", 12.sp, accentColor, 1,
                            fontWeight: FontWeight.w700),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
        itemCount: controller.lessonLists.length,
      ),
    );
  }
}
