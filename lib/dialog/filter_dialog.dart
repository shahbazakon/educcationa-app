import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Constants/color_data.dart';
import '../Constants/constant.dart';
import '../Constants/widget_utils.dart';
import '../controller/controller.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  HomeScreenController controller = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(22.h))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getVerSpace(20.h),
              getCustomFont("Filter", 24.sp, Colors.black, 1,
                  fontWeight: FontWeight.w700, txtHeight: 1.5.h),
              getVerSpace(20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getCustomFont("Price range", 18.sp, Colors.black, 1,
                      fontWeight: FontWeight.w700, txtHeight: 1.5.h),
                  GetBuilder<HomeScreenController>(
                    init: HomeScreenController(),
                    builder: (controller) => getCustomFont(
                        "\$${controller.values.start.toInt()}-\$${controller.values.end.toInt()}",
                        15.sp,
                        Colors.black,
                        1,
                        fontWeight: FontWeight.w700,
                        txtHeight: 1.5.h),
                  )
                ],
              ),
              getVerSpace(10.h),
              GetBuilder<HomeScreenController>(
                init: HomeScreenController(),
                builder: (controller) => SliderTheme(
                  data: SliderThemeData(
                      trackHeight: 6.h,
                      overlayShape: SliderComponentShape.noOverlay,
                      trackShape: const RoundedRectSliderTrackShape()),
                  child: RangeSlider(
                    activeColor: accentColor,
                    inactiveColor: "#E2F5FA".toColor(),
                    min: 1,
                    max: 100,
                    values: controller.values,
                    onChanged: (value) {
                      controller.onChange(value);
                    },
                  ),
                ),
              ),
              getVerSpace(20.h),
              getCustomFont('Ratings', 18.sp, Colors.black, 1,
                  fontWeight: FontWeight.w700, txtHeight: 1.5.h),
              getVerSpace(10.h),
              GetBuilder<HomeScreenController>(
                init: HomeScreenController(),
                builder: (controller) => Row(
                  children: [
                    RatingBar(
                      initialRating: controller.rating.value,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: 24.h,
                      itemCount: 5,
                      ratingWidget: RatingWidget(
                        full: getSvgImage('rating_fill.svg', height: 24.h, width: 24.h),
                        half: getSvgImage('rating_fill.svg', height: 24.h, width: 24.h),
                        empty: getSvgImage('rating_unfill.svg', height: 24.h, width: 24.h),
                      ),
                      itemPadding: EdgeInsets.symmetric(horizontal: 5.h),
                      onRatingUpdate: (rating) {
                        controller.onRatingChange(rating.obs);
                      },
                    ),
                    getHorSpace(20.h),
                    getCustomFont("${controller.rating.value}+", 15.sp, Colors.black, 1,
                        fontWeight: FontWeight.w700, txtHeight: 1.53.h)
                  ],
                ),
              ),
              getVerSpace(20.h),
              getCustomFont("Categories", 18.sp, Colors.black, 1,
                  fontWeight: FontWeight.w700, txtHeight: 1.5.h),
              getVerSpace(10.h),
              GetBuilder<HomeScreenController>(
                init: HomeScreenController(),
                builder: (controller) => Wrap(
                  alignment: WrapAlignment.start,
                  children: [
                    for (final i in List.generate(controller.categoryList.length, (index) => index))
                      getPaddingWidget(
                          EdgeInsets.only(right: 16.h, bottom: 13.h),
                          Wrap(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (!controller.selectedCategory
                                      .contains(controller.categoryList[i])) {
                                    controller.addItem(i);
                                  } else {
                                    controller.removeItem(i);
                                  }
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 13.h),
                                  decoration: BoxDecoration(
                                    color: controller.selectedCategory
                                            .contains(controller.categoryList[i])
                                        ? lightAccent
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(26.h),
                                    border: Border.all(
                                        color: controller.selectedCategory
                                                .contains(controller.categoryList[i])
                                            ? accentColor
                                            : subtextColor,
                                        width: 1.h),
                                  ),
                                  child: getCustomFont(
                                      controller.categoryList[i],
                                      14.sp,
                                      controller.selectedCategory
                                              .contains(controller.categoryList[i])
                                          ? accentColor
                                          : subtextColor,
                                      1,
                                      fontWeight: controller.selectedCategory
                                              .contains(controller.categoryList[i])
                                          ? FontWeight.w700
                                          : FontWeight.w500),
                                ),
                              ),
                            ],
                          ))
                  ],
                ),
              ),
              getVerSpace(30.h),
              Row(
                children: [
                  Expanded(
                      child: getButton(context, accentColor, "Apply", Colors.white, () {
                    Constant.backToPrev(context);
                  }, 18.sp,
                          weight: FontWeight.w700,
                          buttonHeight: 56.h,
                          borderRadius: BorderRadius.circular(22.h))),
                  getHorSpace(20.h),
                  Expanded(
                      child: getButton(
                          context, Colors.white, "Clear All", accentColor, () {}, 18.sp,
                          weight: FontWeight.w700,
                          buttonHeight: 56.h,
                          borderRadius: BorderRadius.circular(22.h),
                          isBorder: true,
                          borderColor: accentColor,
                          borderWidth: 1.h))
                ],
              ),
              getVerSpace(30.h),
            ],
          ),
        )
      ],
    );
  }
}
