import 'dart:developer';

import 'package:education_app/Constants/color_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/constant.dart';
import '../../Constants/widget_utils.dart';
import '../../controller/controller.dart';
import '../../model/model_trending.dart';
import '../../services/API Services/cources_services.dart';
import '../course_detail/course_detail.dart';

class TrendingList extends StatefulWidget {
  const TrendingList({Key? key}) : super(key: key);

  @override
  State<TrendingList> createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList> {
  List<dynamic> addCourses = [];
  void backClick() {
    Constant.backToPrev(context);
  }

  HomeScreenController controller = Get.put(HomeScreenController());

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
              getVerSpace(16.h),
              getToolBar("Trending Course", () {
                backClick();
              }),
              getVerSpace(20.h),
              buildTrendingCourseList()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTrendingCourseList() {
    return FutureBuilder(
      future: CoursesServices().getAddCourse(context),
      builder: (context, snapshot) {
        log("snapshot.hasData: ${snapshot.hasData}");
        log("snapshot.data: ${snapshot.data}", name: "${context.widget}");
        if (snapshot.hasData == false) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        addCourses = snapshot.data as List;
        return GetBuilder<HomeScreenController>(
          init: HomeScreenController(),
          builder: (controller) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: .82,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              primary: false,
              shrinkWrap: true,
              itemCount: addCourses.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                ModelTrending modelTrending = controller.trendingLists[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CourseDetail(
                                  heading: addCourses[index]["heading"],
                                  lessons: addCourses[index]["lessons"],
                                  description: addCourses[index]["description"],
                                  courseDuration: addCourses[index]["courseDuration"],
                                  level: addCourses[index]["level"],
                                  medium: addCourses[index]["medium"],
                                  subjectName: addCourses[index]["subjectName"],
                                )));
                    // Constant.sendToNext(context, Routes.courseDetailRoute);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 172.h,
                        width: 177.h,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(addCourses[index]["image"]), fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(12.h)),
                        padding:
                            EdgeInsets.only(left: 10.h, top: 10.h, right: 147.h, bottom: 142.h),
                        child: GestureDetector(
                          onTap: () {
                            controller.selectChange(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.h),
                                boxShadow: [
                                  BoxShadow(
                                      color: '#2423408F'.toColor(),
                                      offset: const Offset(-4, 5),
                                      blurRadius: 16.h)
                                ]),
                            padding: const EdgeInsets.all(3),
                            child: getSvgImage(controller.trendingLists[index].select == true
                                ? "save_bold.svg"
                                : "save.svg"),
                          ),
                        ),
                      ),
                      getVerSpace(8.h),
                      getMultilineCustomFont(
                          addCourses[index]["courseName"] ?? '', 15.sp, Colors.black,
                          fontWeight: FontWeight.w700, txtHeight: 1.53.h)
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
    // return Expanded(
    //     child: GetBuilder<HomeScreenController>(
    //   init: HomeScreenController(),
    //   builder: (controller) => GridView.builder(
    //       padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 30.h),
    //       itemCount: controller.trendingLists.length,
    //       itemBuilder: (context, index) {
    //         ModelTrending modelTrending = controller.trendingLists[index];
    //         return GestureDetector(
    //           onTap: () {
    //             Constant.sendToNext(context, Routes.courseDetailRoute);
    //           },
    //           child: Container(
    //             decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.circular(12.h),
    //                 boxShadow: [
    //                   BoxShadow(
    //                       color: '#2423408F'.toColor(),
    //                       offset: const Offset(-4, 5),
    //                       blurRadius: 16.h)
    //                 ]),
    //             child: Column(
    //               children: [
    //                 Container(
    //                   height: 165.h,
    //                   width: double.infinity,
    //                   decoration: BoxDecoration(
    //                       image: DecorationImage(
    //                           image: AssetImage(
    //                               Constant.assetImagePath + modelTrending.image.toString()),
    //                           fit: BoxFit.fill),
    //                       borderRadius: BorderRadius.circular(12.h)),
    //                   child: GestureDetector(
    //                     onTap: () {
    //                       controller.selectChange(index);
    //                     },
    //                     child: Row(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         getPaddingWidget(
    //                           EdgeInsets.only(left: 10.h, top: 10.h),
    //                           Container(
    //                             decoration: BoxDecoration(
    //                                 color: Colors.white,
    //                                 borderRadius: BorderRadius.circular(20.h),
    //                                 boxShadow: [
    //                                   BoxShadow(
    //                                       color: '#2423408F'.toColor(),
    //                                       offset: const Offset(-4, 5),
    //                                       blurRadius: 16.h)
    //                                 ]),
    //                             padding: const EdgeInsets.all(3),
    //                             child: getSvgImage(controller.trendingLists[index].select == true
    //                                 ? "save_bold.svg"
    //                                 : "save.svg"),
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //                 getVerSpace(6.h),
    //                 getPaddingWidget(
    //                   EdgeInsets.symmetric(horizontal: 6.h),
    //                   Column(
    //                     children: [
    //                       SizedBox(
    //                         height: 46.h,
    //                         child: getMultilineCustomFont(
    //                             modelTrending.name ?? "", 15.sp, Colors.black,
    //                             fontWeight: FontWeight.w700,
    //                             txtHeight: 1.53.h,
    //                             textAlign: TextAlign.start),
    //                       ),
    //                       getVerSpace(12.h),
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Container(
    //                             decoration: BoxDecoration(
    //                                 color: "#FAF4E1".toColor(),
    //                                 borderRadius: BorderRadius.circular(12.h)),
    //                             padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 5.5.h),
    //                             child: Row(
    //                               children: [
    //                                 getSvgImage("rating_fill.svg", width: 15.h, height: 15.h),
    //                                 getHorSpace(6.h),
    //                                 getCustomFont(
    //                                     modelTrending.rating.toString(), 14.sp, yellowColor, 1,
    //                                     fontWeight: FontWeight.w500)
    //                               ],
    //                             ),
    //                           ),
    //                           Row(
    //                             children: [
    //                               getSvgImage("clock.svg", width: 17.h, height: 17.h),
    //                               getHorSpace(4.h),
    //                               getCustomFont(modelTrending.time ?? "", 14.sp, Colors.black, 1,
    //                                   fontWeight: FontWeight.w500)
    //                             ],
    //                           )
    //                         ],
    //                       ),
    //                       getVerSpace(10.h),
    //                       Row(
    //                         children: [
    //                           getAssetImage(modelTrending.personImage ?? "",
    //                               height: 30.h, width: 30.h),
    //                           getHorSpace(6.h),
    //                           getCustomFont(modelTrending.person ?? '', 14.sp, accentColor, 1,
    //                               fontWeight: FontWeight.w500)
    //                         ],
    //                       )
    //                     ],
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),
    //         );
    //       },
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //           crossAxisCount: 2,
    //           mainAxisExtent: 302.h,
    //           mainAxisSpacing: 20.h,
    //           crossAxisSpacing: 18.h)),
    // ));
  }
}
