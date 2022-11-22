import 'package:education_app/Constants/color_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/constant.dart';
import '../../Constants/widget_utils.dart';
import '../../controller/controller.dart';
import '../../dialog/add_card_dialog.dart';
import '../../dialog/delete_dialog.dart';
import '../../model/model_card.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  PaymentController controller = Get.put(PaymentController());

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
              getVerSpace(20.h),
              getToolBar("Payment", () {
                backClick();
              }),
              getVerSpace(39.h),
              Expanded(
                  flex: 1,
                  child: GetBuilder<PaymentController>(
                    init: PaymentController(),
                    builder: (controller) => ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20.h),
                      itemCount: controller.cardLists.length,
                      primary: true,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        ModelCard modelCard = controller.cardLists[index];
                        return GestureDetector(
                          onTap: () {
                            controller.onChange(index.obs);
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20.h),
                            padding: EdgeInsets.all(20.h),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.h),
                                boxShadow: [
                                  BoxShadow(
                                      color: "#2423408F".toColor(),
                                      offset: const Offset(-4, 5),
                                      blurRadius: 16.h)
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    getAssetImage(modelCard.image ?? "", width: 24.h, height: 24.h),
                                    getHorSpace(30.h),
                                    getCustomFont(modelCard.name ?? "", 15.sp, Colors.black, 1,
                                        fontWeight: FontWeight.w700, txtHeight: 1.53.h)
                                  ],
                                ),
                                Theme(
                                  data: Theme.of(context).copyWith(
                                    dividerTheme:
                                        DividerThemeData(color: borderColor, thickness: 1.5.h),
                                  ),
                                  child: PopupMenuButton<int>(
                                    position: PopupMenuPosition.under,
                                    offset: const Offset(0, 0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12.h)),
                                    padding: EdgeInsets.zero,
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        height: 47.h,
                                        value: 0,
                                        child: getCustomFont("Edit", 15.sp, Colors.black, 1,
                                            fontWeight: FontWeight.w700, txtHeight: 1.5.h),
                                      ),
                                      PopupMenuDivider(
                                        height: 1.h,
                                      ),
                                      PopupMenuItem(
                                        height: 47.h,
                                        value: 1,
                                        child: getCustomFont("Delete", 15.sp, Colors.black, 1,
                                            fontWeight: FontWeight.w700, txtHeight: 1.5.h),
                                      ),
                                    ],
                                    onSelected: (value) {
                                      if (value == 0) {
                                      } else if (value == 1) {
                                        showDialog(
                                                builder: (context) {
                                                  return DeleteDialog(index);
                                                },
                                                context: context)
                                            .then((value) {
                                          setState(() {});
                                        });
                                      }
                                    },
                                    child: Container(
                                      child: getSvgImage("more.svg", height: 24.h, width: 24.h),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )),
              getPaddingWidget(
                EdgeInsets.symmetric(horizontal: 20.h),
                getButton(context, accentColor, "Add New Card", Colors.white, () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(22.h))),
                      builder: (context) {
                        return const AddCardDialog();
                      },
                      context: context);
                }, 18.sp,
                    weight: FontWeight.w700,
                    buttonHeight: 56.h,
                    borderRadius: BorderRadius.circular(22.h)),
              ),
              getVerSpace(30.h)
            ],
          ),
        ),
      ),
    );
  }
}
