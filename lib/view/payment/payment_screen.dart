import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/color_data.dart';
import '../../Constants/constant.dart';
import '../../Constants/widget_utils.dart';
import '../../controller/controller.dart';
import '../../data/data_file.dart';
import '../../dialog/add_card_dialog.dart';
import '../../dialog/payment_success_dialog.dart';
import '../../model/model_card.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  PaymentController controller = Get.put(PaymentController());
  List<ModelCard> cardLists = DataFile.cardList;

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
        bottomNavigationBar: buildConfirmButton(context),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getVerSpace(20.h),
              getToolBar("Payment", () {
                backClick();
              }),
              getVerSpace(20.h),
              buildTotalWidget(),
              getVerSpace(30.h),
              getPaddingWidget(
                EdgeInsets.symmetric(horizontal: 20.h),
                getCustomFont("Select Payment", 20.sp, Colors.black, 1,
                    fontWeight: FontWeight.w700, txtHeight: 1.2.h),
              ),
              getVerSpace(20.h),
              buildCardList(),
              buildAddCardButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Align buildAddCardButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(22.h))),
              builder: (context) {
                return const AddCardDialog();
              },
              context: context);
        },
        child: getCustomFont("Add New +", 18.sp, accentColor, 1,
            fontWeight: FontWeight.w500, txtHeight: 1.66.h),
      ),
    );
  }

  GetBuilder<PaymentController> buildCardList() {
    return GetBuilder<PaymentController>(
      init: PaymentController(),
      builder: (controller) => ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        itemCount: cardLists.length,
        primary: true,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          ModelCard modelCard = cardLists[index];
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
                        color: "#2423408F".toColor(), offset: const Offset(-4, 5), blurRadius: 16.h)
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
                  getSvgImage(controller.select.value == index ? "radio.svg" : "unradio.svg",
                      height: 24.h, width: 24.h)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildTotalWidget() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.h),
          boxShadow: [
            BoxShadow(color: "#2423408F".toColor(), offset: const Offset(-4, 5), blurRadius: 16.h)
          ]),
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      padding: EdgeInsets.all(18.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getCustomFont("Total", 20.sp, Colors.black, 1,
              fontWeight: FontWeight.w700, txtHeight: 1.2.h),
          getCustomFont("\$99", 20.sp, accentColor, 1,
              fontWeight: FontWeight.w700, txtHeight: 1.2.h)
        ],
      ),
    );
  }

  Container buildConfirmButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30.h, right: 20.h, left: 20.h),
      child: getButton(context, accentColor, "Confirm", Colors.white, () {
        showDialog(
            builder: (context) {
              return const PaymentSuccessDialog();
            },
            context: context);
      }, 18.sp,
          weight: FontWeight.w700, buttonHeight: 56.h, borderRadius: BorderRadius.circular(22.h)),
    );
  }
}
