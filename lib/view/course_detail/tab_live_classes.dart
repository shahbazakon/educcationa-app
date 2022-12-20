import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../Constants/color_data.dart';
import '../../Constants/widget_utils.dart';
import '../../controller/controller.dart';
import '../../data/data_file.dart';
import '../../model/model_lesson.dart';
import '../../model/model_review.dart';
import '../../services/API Services/cources_services.dart';

class TabLiveClasses extends StatefulWidget {
  YoutubePlayerController? videoController;
  TabLiveClasses({Key? key, this.videoController}) : super(key: key);

  @override
  State<TabLiveClasses> createState() => _TabLiveClassesState();
}

class _TabLiveClassesState extends State<TabLiveClasses> {
  List<ModelReview> reviewLists = DataFile.reviewList;
  List<dynamic> liveClasses = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CoursesServices().getLiveCourses(context),
      builder: (context, snapshot) {
        log('snapshot response : ${snapshot.data}', name: "${context.widget}");

        if (snapshot.hasData == false) {
          return const Center(child: CircularProgressIndicator());
        }
        liveClasses = snapshot.data as List;
        log('snapshot liveClasses : ${snapshot.data}', name: "${context.widget}");
        return GetBuilder<LessonController>(
          init: LessonController(),
          builder: (controller) => ListView.builder(
            itemCount: liveClasses.length,
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            itemBuilder: (context, index) {
              ModelLesson modelLesson = controller.lessonLists[index];
              log('snapshot response : ${snapshot.data as List}', name: "${context.widget}");
              return Container(
                margin: EdgeInsets.only(bottom: 20.h),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22.h),
                    boxShadow: [
                      BoxShadow(
                          color: "#2423408F".toColor(),
                          blurRadius: 16.h,
                          offset: const Offset(-4, 5))
                    ]),
                child: ListTile(
                  onTap: () {
                    widget.videoController?.play();
                    widget.videoController?.load(liveClasses[index]["videoLink"]);
                  },
                  contentPadding: EdgeInsets.only(left: 5.h, right: 20.h),
                  trailing: getSvgImage("video-circle.svg", width: 24.h, height: 24.h),
                  title: Row(
                    children: [
                      getAssetImage(modelLesson.image ?? "", height: 66.h, width: 66.h),
                      getHorSpace(12.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          getCustomFont(
                              liveClasses[index]["classTitle"] ?? "", 14.sp, Colors.black, 1,
                              fontWeight: FontWeight.w700, txtHeight: 1.5.h),
                          getVerSpace(4.h),
                          Container(
                            decoration: BoxDecoration(
                              color: lightAccent,
                              borderRadius: BorderRadius.circular(22.h),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 1.h),
                            child: getCustomFont(
                                liveClasses[index]["instructorName"] ?? "", 12.sp, accentColor, 1,
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
