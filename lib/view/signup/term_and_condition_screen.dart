import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constants/color_data.dart';
import '../../Constants/constant.dart';
import '../../Constants/widget_utils.dart';

class TermConditionScreen extends StatefulWidget {
  const TermConditionScreen({Key? key}) : super(key: key);

  @override
  State<TermConditionScreen> createState() => _TermConditionScreenState();
}

class _TermConditionScreenState extends State<TermConditionScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

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
              getToolBar("Terms And Conditions", () {
                backClick();
              }),
              getVerSpace(31.h),
              Expanded(
                  flex: 1,
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    children: [
                      getCustomFont("1. Types of Data we collect", 15.sp, Colors.black, 1,
                          fontWeight: FontWeight.w700, textAlign: TextAlign.start),
                      getVerSpace(16.h),
                      getMultilineCustomFont(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          14.sp,
                          subtextColor,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                          txtHeight: 1.5.h),
                      getVerSpace(31.h),
                      getCustomFont("2. Use of your personal Data", 15.sp, Colors.black, 1,
                          fontWeight: FontWeight.w700, textAlign: TextAlign.start),
                      getVerSpace(16.h),
                      getMultilineCustomFont(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          14.sp,
                          subtextColor,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                          txtHeight: 1.5.h),
                      getVerSpace(31.h),
                      getCustomFont("3.Disclosure of your personal Data", 15.sp, Colors.black, 1,
                          fontWeight: FontWeight.w700, textAlign: TextAlign.start),
                      getVerSpace(16.h),
                      getMultilineCustomFont(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          14.sp,
                          subtextColor,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.start,
                          txtHeight: 1.5.h),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
