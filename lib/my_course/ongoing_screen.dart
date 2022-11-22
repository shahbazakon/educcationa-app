import 'package:education_app/Constants/color_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../model/model_ongoing.dart';
import '../Constants/constant.dart';
import '../Constants/widget_utils.dart';
import '../data/data_file.dart';
import '../routes/app_routes.dart';

class OngoingScreen extends StatefulWidget {
  const OngoingScreen({Key? key}) : super(key: key);

  @override
  State<OngoingScreen> createState() => _OngoingScreenState();
}

class _OngoingScreenState extends State<OngoingScreen> {
  List<ModelOngoing> ongoingLists = DataFile.ongoingList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      primary: true,
      shrinkWrap: true,
      itemCount: ongoingLists.length,
      itemBuilder: (context, index) {
        ModelOngoing modelOngoing = ongoingLists[index];
        return GestureDetector(
          onTap: () {
            Constant.sendToNext(context, Routes.myCourseDetailRoute);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 20.h),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22.h),
                boxShadow: [
                  BoxShadow(
                      color: "#2423408F".toColor(), blurRadius: 16.h, offset: const Offset(-4, 5))
                ]),
            padding: EdgeInsets.all(12.h),
            child: Row(
              children: [
                getAssetImage(modelOngoing.image ?? "", height: 100.h, width: 100.h),
                getHorSpace(12.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getCustomFont(modelOngoing.name ?? "", 18.sp, Colors.black, 1,
                        fontWeight: FontWeight.w500, txtHeight: 1.66.h),
                    getVerSpace(4.h),
                    getCustomFont(modelOngoing.lesson ?? "", 14.sp, jetColor, 1,
                        fontWeight: FontWeight.w500, txtHeight: 1.5.h),
                    getVerSpace(12.h),
                    Row(
                      children: [
                        LinearPercentIndicator(
                          width: 150.w,
                          padding: EdgeInsets.zero,
                          backgroundColor: darkgrey,
                          progressColor: accentColor,
                          animation: true,
                          lineHeight: 4.h,
                          barRadius: Radius.circular(10.h),
                          percent: modelOngoing.value ?? 0.0,
                        ),
                        getHorSpace(12.h),
                        getCustomFont(modelOngoing.percent ?? '', 14.sp, Colors.black, 1,
                            fontWeight: FontWeight.w500, txtHeight: 1.5.h)
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
