import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../Constants/color_data.dart';
import '../../Constants/widget_utils.dart';
import '../../data/data_file.dart';
import '../../model/model_review.dart';

class TabReviews extends StatefulWidget {
  const TabReviews({Key? key}) : super(key: key);

  @override
  State<TabReviews> createState() => _TabReviewsState();
}

class _TabReviewsState extends State<TabReviews> {
  List<ModelReview> reviewLists = DataFile.reviewList;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.h),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getCustomFont("Rating & Reviews", 18.sp, Colors.black, 1,
                fontWeight: FontWeight.w500, txtHeight: 1.66.h),
            getCustomFont("View All", 18.sp, Colors.black, 1,
                fontWeight: FontWeight.w500, txtHeight: 1.66.h)
          ],
        ),
        getVerSpace(12.h),
        buildRatingWidget(),
        getVerSpace(8.h),
        getCustomFont("1k Reviews", 14.sp, Colors.black, 1,
            fontWeight: FontWeight.w500, txtHeight: 1.5.h, textAlign: TextAlign.end),
        getVerSpace(12.h),
        buildWriteReview(),
        getVerSpace(12.h),
        buildReviewList()
      ],
    );
  }

  ListView buildReviewList() {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: reviewLists.length,
      itemBuilder: (context, index) {
        ModelReview modelReview = reviewLists[index];
        return Container(
          margin: EdgeInsets.only(bottom: 12.h),
          padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    getAssetImage(modelReview.image ?? "", width: 32.h, height: 32.h),
                    getHorSpace(7.5.h),
                    Expanded(
                      flex: 1,
                      child: getMultilineCustomFont(modelReview.review ?? "", 14.sp, jetColor,
                          fontWeight: FontWeight.w500,
                          txtHeight: 1.5.h,
                          textAlign: TextAlign.start),
                    ),
                  ],
                ),
              ),
              getCustomFont(modelReview.day ?? "", 12.sp, accentColor, 1,
                  fontWeight: FontWeight.w500, txtHeight: 1.5.h)
            ],
          ),
        );
      },
    );
  }

  Row buildWriteReview() {
    return Row(
      children: [
        getCustomFont("Write A Review", 15.sp, Colors.black, 1,
            fontWeight: FontWeight.w700, txtHeight: 1.53.h),
        getHorSpace(11.h),
        RatingBar(
          initialRating: 5,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemSize: 21.62.h,
          itemCount: 5,
          ratingWidget: RatingWidget(
            full: getAssetImage(
              'star_yellow.png',
              height: 21.h,
              width: 21.h,
            ),
            half: getAssetImage('rating.png', height: 21.h, width: 21.h),
            empty: getAssetImage('rating.png', height: 21.h, width: 21.h),
          ),
          itemPadding: EdgeInsets.symmetric(horizontal: 2.h),
          onRatingUpdate: (rating) {},
        ),
      ],
    );
  }

  Row buildRatingWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            getCustomFont("4.5", 36.sp, Colors.black, 1,
                fontWeight: FontWeight.w700, txtHeight: 1.19.h),
            getVerSpace(6.h),
            getCustomFont("out of 5", 15.sp, Colors.black, 1,
                fontWeight: FontWeight.w400, txtHeight: 1.53.h)
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                RatingBar(
                  initialRating: 5,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemSize: 10.h,
                  itemCount: 5,
                  tapOnlyMode: true,
                  ratingWidget: RatingWidget(
                    full: getSvgImage('rating_fill.svg',
                        height: 24.h, width: 24.h, color: accentColor),
                    half: getSvgImage('rating_fill.svg',
                        height: 24.h, width: 24.h, color: accentColor),
                    empty: getSvgImage('rating_fill.svg',
                        height: 24.h, width: 24.h, color: accentColor),
                  ),
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.h),
                  onRatingUpdate: (rating) {},
                ),
                getHorSpace(4.h),
                LinearPercentIndicator(
                  width: 204.w,
                  padding: EdgeInsets.zero,
                  backgroundColor: darkgrey,
                  progressColor: accentColor,
                  animation: true,
                  lineHeight: 4.h,
                  barRadius: Radius.circular(10.h),
                  percent: 1.0,
                )
              ],
            ),
            getVerSpace(4.h),
            Row(
              children: [
                RatingBar(
                  initialRating: 4,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemSize: 10.h,
                  itemCount: 4,
                  tapOnlyMode: true,
                  ratingWidget: RatingWidget(
                    full: getSvgImage('rating_fill.svg',
                        height: 24.h, width: 24.h, color: accentColor),
                    half: getSvgImage('rating_fill.svg',
                        height: 24.h, width: 24.h, color: accentColor),
                    empty: getSvgImage('rating_fill.svg',
                        height: 24.h, width: 24.h, color: accentColor),
                  ),
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.h),
                  onRatingUpdate: (rating) {},
                ),
                getHorSpace(4.h),
                LinearPercentIndicator(
                  width: 204.w,
                  padding: EdgeInsets.zero,
                  backgroundColor: darkgrey,
                  progressColor: accentColor,
                  animation: true,
                  lineHeight: 4.h,
                  barRadius: Radius.circular(10.h),
                  percent: 0.6,
                )
              ],
            ),
            getVerSpace(4.h),
            Row(
              children: [
                RatingBar(
                  initialRating: 3,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemSize: 10.h,
                  itemCount: 3,
                  tapOnlyMode: true,
                  ratingWidget: RatingWidget(
                    full: getSvgImage('rating_fill.svg',
                        height: 24.h, width: 24.h, color: accentColor),
                    half: getSvgImage('rating_fill.svg',
                        height: 24.h, width: 24.h, color: accentColor),
                    empty: getSvgImage('rating_fill.svg',
                        height: 24.h, width: 24.h, color: accentColor),
                  ),
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.h),
                  onRatingUpdate: (rating) {},
                ),
                getHorSpace(4.h),
                LinearPercentIndicator(
                  width: 204.w,
                  padding: EdgeInsets.zero,
                  backgroundColor: darkgrey,
                  progressColor: accentColor,
                  animation: true,
                  lineHeight: 4.h,
                  barRadius: Radius.circular(10.h),
                  percent: 0.3,
                )
              ],
            ),
            getVerSpace(4.h),
            Row(
              children: [
                RatingBar(
                  initialRating: 2,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemSize: 10.h,
                  itemCount: 2,
                  tapOnlyMode: true,
                  ratingWidget: RatingWidget(
                    full: getSvgImage('rating_fill.svg',
                        height: 24.h, width: 24.h, color: accentColor),
                    half: getSvgImage('rating_fill.svg',
                        height: 24.h, width: 24.h, color: accentColor),
                    empty: getSvgImage('rating_fill.svg',
                        height: 24.h, width: 24.h, color: accentColor),
                  ),
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.h),
                  onRatingUpdate: (rating) {},
                ),
                getHorSpace(4.h),
                LinearPercentIndicator(
                  width: 204.w,
                  padding: EdgeInsets.zero,
                  backgroundColor: darkgrey,
                  progressColor: accentColor,
                  animation: true,
                  lineHeight: 4.h,
                  barRadius: Radius.circular(10.h),
                  percent: 0.4,
                )
              ],
            ),
            getVerSpace(4.h),
            Row(
              children: [
                RatingBar(
                  initialRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemSize: 10.h,
                  itemCount: 1,
                  tapOnlyMode: true,
                  ratingWidget: RatingWidget(
                    full: getSvgImage('rating_fill.svg',
                        height: 24.h, width: 24.h, color: accentColor),
                    half: getSvgImage('rating_fill.svg',
                        height: 24.h, width: 24.h, color: accentColor),
                    empty: getSvgImage('rating_fill.svg',
                        height: 24.h, width: 24.h, color: accentColor),
                  ),
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.h),
                  onRatingUpdate: (rating) {},
                ),
                getHorSpace(4.h),
                LinearPercentIndicator(
                  width: 204.w,
                  padding: EdgeInsets.zero,
                  backgroundColor: darkgrey,
                  progressColor: accentColor,
                  animation: true,
                  lineHeight: 4.h,
                  barRadius: Radius.circular(10.h),
                  percent: 0.1,
                )
              ],
            )
          ],
        )
      ],
    );
  }
}
