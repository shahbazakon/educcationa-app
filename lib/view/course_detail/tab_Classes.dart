import 'dart:developer';

import 'package:education_app/Constants/color_data.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/widget_utils.dart';
import '../../controller/controller.dart';
import '../../model/model_lesson.dart';
import '../../services/API Services/cources_services.dart';

class TabClasses extends StatefulWidget {
  const TabClasses({Key? key}) : super(key: key);

  @override
  State<TabClasses> createState() => _TabClassesState();
}

class _TabClassesState extends State<TabClasses> {
  LessonController controller = Get.put(LessonController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LessonController>(
      init: LessonController(),
      builder: (controller) {
        return FutureBuilder(
          future: CoursesServices().getUploadContent(context),
          builder: (context, snapshot) {
            log("getUploadContent snapshot: ${snapshot.data}");
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              itemCount: controller.lessonLists.length,
              itemBuilder: (context, index) {
                ModelLesson modelLesson = controller.lessonLists[index];
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
                  child: ExpansionTileCard(
                    initiallyExpanded: controller.lessonLists[index].expand == true ? true : false,
                    onExpansionChanged: (value) {
                      controller.expandChange(index.obs);
                    },
                    contentPadding: EdgeInsets.only(left: 5.h, right: 20.h),
                    elevation: 0,
                    initialElevation: 0,
                    trailing: AnimatedRotation(
                      turns: controller.lessonLists[index].expand == true ? .5 : 0,
                      duration: const Duration(milliseconds: 1),
                      child: getSvgImage("arrow_down.svg", width: 24.h, height: 24.h),
                    ),
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
                    baseColor: Colors.white,
                    borderRadius: BorderRadius.circular(22.h),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListView.separated(
                          itemCount: 4,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Table(
                              // border: TableBorder.all(width: 1.0, color: Colors.red),
                              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                              columnWidths: const {
                                0: FlexColumnWidth(2),
                                1: FlexColumnWidth(6),
                                2: FlexColumnWidth(2),
                                3: FlexColumnWidth(2),
                                4: FlexColumnWidth(5),
                              },
                              children: [
                                TableRow(children: [
                                  getSvgImage("video-circle.svg", height: 20.h, width: 20.h),
                                  const Text(
                                    "View Class 4",
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  const Icon(
                                    Icons.file_copy_outlined,
                                    color: Colors.amberAccent,
                                  ),
                                  const Icon(
                                    Icons.file_download_outlined,
                                    color: Colors.indigo,
                                  ),
                                  const Text(
                                    "22/02/2022",
                                    textAlign: TextAlign.end,
                                  )
                                ])
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider();
                          },
                        ),
                      ),
                      // getPaddingWidget(
                      //   EdgeInsets.only(left: 12.h, right: 20.h),
                      //   Column(
                      //     children: [
                      //       getVerSpace(15.h),
                      //       Row(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Expanded(
                      //             flex: 1,
                      //             child: Row(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 getSvgImage("video-circle.svg", height: 20.h, width: 20.h),
                      //                 getHorSpace(12.h),
                      //                 Expanded(
                      //                   flex: 1,
                      //                   child: getMultilineCustomFont(
                      //                       "Lorem ipsum dolor sit amet consectetur adipiscing elit",
                      //                       14.sp,
                      //                       Colors.black,
                      //                       fontWeight: FontWeight.w500,
                      //                       txtHeight: 1.5.h),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //           Row(
                      //             children: [
                      //               getHorSpace(14.h),
                      //               getCustomFont("10", 14.sp, accentColor, 1,
                      //                   fontWeight: FontWeight.w500, txtHeight: 1.5.h)
                      //             ],
                      //           )
                      //         ],
                      //       ),
                      //       getVerSpace(12.h),
                      //       Row(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Expanded(
                      //             flex: 1,
                      //             child: Row(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 getSvgImage("document.svg", height: 20.h, width: 20.h),
                      //                 getHorSpace(12.h),
                      //                 Expanded(
                      //                   flex: 1,
                      //                   child: getMultilineCustomFont(
                      //                       "Lorem ipsum dolor sit amet", 14.sp, Colors.black,
                      //                       fontWeight: FontWeight.w500, txtHeight: 1.5.h),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //           Row(
                      //             children: [
                      //               getHorSpace(14.h),
                      //               getCustomFont("9", 14.sp, accentColor, 1,
                      //                   fontWeight: FontWeight.w500, txtHeight: 1.5.h)
                      //             ],
                      //           )
                      //         ],
                      //       ),
                      //       getVerSpace(12.h),
                      //       Row(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Expanded(
                      //             flex: 1,
                      //             child: Row(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 getSvgImage("video-circle.svg", height: 20.h, width: 20.h),
                      //                 getHorSpace(12.h),
                      //                 Expanded(
                      //                   flex: 1,
                      //                   child: getMultilineCustomFont(
                      //                       "Lorem ipsum dolor sit amet", 14.sp, Colors.black,
                      //                       fontWeight: FontWeight.w500, txtHeight: 1.5.h),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //           Row(
                      //             children: [
                      //               getHorSpace(14.h),
                      //               getCustomFont("7", 14.sp, accentColor, 1,
                      //                   fontWeight: FontWeight.w500, txtHeight: 1.5.h)
                      //             ],
                      //           )
                      //         ],
                      //       ),
                      //       getVerSpace(12.h),
                      //       Row(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Expanded(
                      //             flex: 1,
                      //             child: Row(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 getSvgImage("document.svg", height: 20.h, width: 20.h),
                      //                 getHorSpace(12.h),
                      //                 Expanded(
                      //                   flex: 1,
                      //                   child: getMultilineCustomFont(
                      //                       "Lorem ipsum dolor sit amet", 14.sp, Colors.black,
                      //                       fontWeight: FontWeight.w500, txtHeight: 1.5.h),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //           Row(
                      //             children: [
                      //               getHorSpace(14.h),
                      //               getCustomFont("12", 14.sp, accentColor, 1,
                      //                   fontWeight: FontWeight.w500, txtHeight: 1.5.h)
                      //             ],
                      //           )
                      //         ],
                      //       ),
                      //       getVerSpace(20.h)
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
