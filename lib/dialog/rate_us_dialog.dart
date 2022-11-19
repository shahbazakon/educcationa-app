import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/color_data.dart';
import '../Constants/constant.dart';
import '../Constants/widget_utils.dart';

class RateUsDialog extends StatefulWidget {
  const RateUsDialog({Key? key}) : super(key: key);

  @override
  State<RateUsDialog> createState() => _RateUsDialogState();
}

class _RateUsDialogState extends State<RateUsDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.h)),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.h),
      backgroundColor: Colors.white,
      child: getPaddingWidget(
        EdgeInsets.symmetric(horizontal: 20.h),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            getVerSpace(50.h),
            getAssetImage("rateus_image.png", width: 290.h, height: 174.h),
            getVerSpace(40.h),
            getCustomFont("Give Your Opinion", 22.sp, Colors.black, 1,
                fontWeight: FontWeight.w700, txtHeight: 1.27.h),
            getVerSpace(12.h),
            getMultilineCustomFont(
                "Make better math goal for you, and would love to know how would rate our app?",
                15.sp,
                Colors.black,
                fontWeight: FontWeight.w400,
                txtHeight: 1.53.h,
                textAlign: TextAlign.center),
            getVerSpace(20.h),
            RatingBar(
              initialRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemSize: 44.h,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: getSvgImage('rating_fill.svg', height: 24.h, width: 24.h),
                half: getSvgImage('rating_fill.svg', height: 24.h, width: 24.h),
                empty: getSvgImage('rating_unfill.svg', height: 24.h, width: 24.h),
              ),
              itemPadding: EdgeInsets.symmetric(horizontal: 10.h),
              onRatingUpdate: (rating) {},
            ),
            getVerSpace(30.h),
            Row(
              children: [
                Expanded(
                    child: getButton(context, accentColor, "Cancle", Colors.white, () {
                  Constant.backToPrev(context);
                }, 18.sp,
                        weight: FontWeight.w700,
                        buttonHeight: 56.h,
                        borderRadius: BorderRadius.circular(22.h))),
                getHorSpace(18.h),
                Expanded(
                    child: getButton(context, Colors.white, "Submit", accentColor, () {
                  Constant.backToPrev(context);
                }, 18.sp,
                        weight: FontWeight.w700,
                        buttonHeight: 56.h,
                        borderRadius: BorderRadius.circular(22.h),
                        isBorder: true,
                        borderColor: accentColor,
                        borderWidth: 1.h)),
              ],
            ),
            getVerSpace(50.h)
          ],
        ),
      ),
    );
  }
}
