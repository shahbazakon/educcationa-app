import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constants/color_data.dart';
import '../../Constants/widget_utils.dart';
import '../../data/data_file.dart';
import '../../model/model_detail_category.dart';

class TabOverView extends StatefulWidget {
  const TabOverView({Key? key}) : super(key: key);

  @override
  State<TabOverView> createState() => _TabOverViewState();
}

class _TabOverViewState extends State<TabOverView> {
  List<ModelDetailCategory> detailCategoryLists = DataFile.detailCategoryList;
  List<String> category = ["History", "Chemistry", "Physics", "Geology", "Mathematica"];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        getPaddingWidget(
          EdgeInsets.symmetric(horizontal: 20.h),
          getCustomFont("UI UX Design Replace with Foundation Batch 2023", 18.sp, Colors.black, 1,
              fontWeight: FontWeight.w500, txtHeight: 1.66.h),
        ),
        getVerSpace(4.h),
        getPaddingWidget(
          EdgeInsets.symmetric(horizontal: 20.h),
          getRichText(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ",
              subtextColor,
              FontWeight.w500,
              14.sp,
              "Learn more.",
              accentColor,
              FontWeight.w700,
              14.sp,
              txtHeight: 1.5.h,
              textAlign: TextAlign.start),
        ),
        getVerSpace(20.h),
        GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            primary: false,
            shrinkWrap: true,
            itemCount: detailCategoryLists.length,
            itemBuilder: (context, index) {
              ModelDetailCategory modelDetailCategory = detailCategoryLists[index];
              return Container(
                decoration: BoxDecoration(
                    color: "#F3F6FF".toColor(), borderRadius: BorderRadius.circular(22.h)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getSvgImage(modelDetailCategory.image ?? "", width: 30.h, height: 30.h),
                    getVerSpace(8.h),
                    getCustomFont(modelDetailCategory.name ?? "", 14.sp, Colors.black, 1,
                        fontWeight: FontWeight.w700, txtHeight: 1.5.h)
                  ],
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 83.h,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 12.h)),
        getVerSpace(20.h),
        getPaddingWidget(
          EdgeInsets.symmetric(horizontal: 20.h),
          getCustomFont("Subjects", 18.sp, Colors.black, 1,
              fontWeight: FontWeight.w700, txtHeight: 1.5.h),
        ),
        getVerSpace(12.h),
        getPaddingWidget(
          EdgeInsets.symmetric(horizontal: 20.h),
          Wrap(
            alignment: WrapAlignment.start,
            children: [
              for (final i in List.generate(category.length, (index) => index))
                getPaddingWidget(
                    EdgeInsets.only(right: 17.h, bottom: 12.h),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26.h),
                          border: Border.all(color: subtextColor, width: 1.h)),
                      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 6.h),
                      child: getCustomFont(category[i], 14.sp, subtextColor, 1,
                          fontWeight: FontWeight.w500),
                    ))
            ],
          ),
        ),
      ],
    );
  }
}