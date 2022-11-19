import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/color_data.dart';
import '../../Constants/constant.dart';
import '../../Constants/widget_utils.dart';
import '../../controller/controller.dart';
import '../../model/model_country.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({Key? key}) : super(key: key);

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  ForgotController controller = Get.put(ForgotController());

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.white);
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getVerSpace(16.h),
              GestureDetector(
                  onTap: () {
                    backClick();
                  },
                  child: getPaddingWidget(
                    EdgeInsets.symmetric(horizontal: 20.h),
                    getSvgImage("arrow_left.svg", width: 24.h, height: 24.h),
                  )),
              getVerSpace(20.h),
              Align(
                alignment: Alignment.topCenter,
                child: getCustomFont("Select Country", 24.sp, Colors.black, 1,
                    fontWeight: FontWeight.w700, textAlign: TextAlign.center),
              ),
              getVerSpace(30.h),
              getPaddingWidget(
                EdgeInsets.symmetric(horizontal: 20.h),
                getSearchWidget(context, "Search", controller.searchController,
                    isEnable: false,
                    isprefix: true,
                    prefix: Row(
                      children: [
                        getHorSpace(18.h),
                        getSvgImage("search.svg", height: 24.h, width: 24.h),
                      ],
                    ),
                    constraint: BoxConstraints(maxHeight: 24.h, maxWidth: 55.h),
                    onChanged: controller.onItemChanged),
              ),
              getVerSpace(30.h),
              Expanded(
                  flex: 1,
                  child: GetBuilder<ForgotController>(
                    init: ForgotController(),
                    builder: (controller) => ListView.separated(
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: borderColor,
                          thickness: 1.h,
                          height: 1.h,
                        );
                      },
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      primary: true,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.newCountryLists.length,
                      itemBuilder: (context, index) {
                        ModelCountry modelCountry = controller.newCountryLists[index];
                        return GestureDetector(
                          onTap: () {
                            controller.getImage(modelCountry.image ?? "", modelCountry.code ?? "");
                            backClick();
                          },
                          child: getPaddingWidget(
                            EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    getAssetImage(modelCountry.image ?? "",
                                        height: 24.h, width: 40.h),
                                    getHorSpace(10.h),
                                    getCustomFont(modelCountry.name ?? "", 15.sp, Colors.black, 1,
                                        fontWeight: FontWeight.w700)
                                  ],
                                ),
                                getCustomFont(modelCountry.code ?? '', 20.sp, Colors.black, 1,
                                    fontWeight: FontWeight.w700)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
