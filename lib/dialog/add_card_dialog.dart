// ignore_for_file: avoid_renaming_method_parameters

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Constants/color_data.dart';
import '../Constants/widget_utils.dart';
import '../controller/controller.dart';

class AddCardDialog extends StatefulWidget {
  const AddCardDialog({Key? key}) : super(key: key);

  @override
  State<AddCardDialog> createState() => _AddCardDialogState();
}

class _AddCardDialogState extends State<AddCardDialog> {
  PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(22.h))),
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                getVerSpace(33.h),
                getCustomFont("Add Card", 18.sp, Colors.black, 1,
                    fontWeight: FontWeight.w500, txtHeight: 1.66.h),
                getVerSpace(20.h),
                getProfileTextField(context, "Name On Card", controller.cardNameController,
                    isEnable: false,
                    height: 60.h,
                    vertical: 19.h,
                    isprefix: true,
                    prefix: getPaddingWidget(EdgeInsets.only(left: 18.h, right: 12.h),
                        getSvgImage("profile-1.svg", width: 24.h, height: 24.h))),
                getVerSpace(20.h),
                getProfileTextField(context, "Card Number", controller.cardNumberController,
                    isEnable: false,
                    height: 60.h,
                    vertical: 19.h,
                    isprefix: true,
                    prefix: getPaddingWidget(EdgeInsets.only(left: 18.h, right: 12.h),
                        getSvgImage("card_grey.svg", width: 24.h, height: 24.h)),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CardNumberFormatter(),
                    ],
                    length: 19),
                getVerSpace(20.h),
                Row(
                  children: [
                    Expanded(
                      child: getProfileTextField(
                        context,
                        "MM/YY",
                        controller.dateController,
                        isEnable: false,
                        height: 60.h,
                        vertical: 19.h,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            value = value.replaceAll(RegExp(r"\D"), "");
                            switch (value.length) {
                              case 0:
                                controller.dateController.selection =
                                    const TextSelection.collapsed(offset: 0);
                                break;
                              case 1:
                                controller.dateController.text = "$value/";
                                controller.dateController.selection =
                                    const TextSelection.collapsed(offset: 1);
                                break;
                              case 2:
                                controller.dateController.text = "$value/";
                                controller.dateController.selection =
                                    const TextSelection.collapsed(offset: 2);
                                break;
                              case 3:
                                controller.dateController.text =
                                    "${value.substring(0, 2)}/${value.substring(2)}";
                                controller.dateController.selection =
                                    const TextSelection.collapsed(offset: 4);
                                break;
                              case 4:
                                controller.dateController.text =
                                    "${value.substring(0, 2)}/${value.substring(2, 4)}";
                                controller.dateController.selection =
                                    const TextSelection.collapsed(offset: 5);
                                break;
                            }
                            if (value.length > 4) {
                              controller.dateController.text =
                                  "${value.substring(0, 2)}/${value.substring(2, 4)}";
                              controller.dateController.selection =
                                  const TextSelection.collapsed(offset: 5);
                            }
                          });
                        },
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                    getHorSpace(20.h),
                    Expanded(
                      child: getProfileTextField(context, "CVV", controller.cvvController,
                          isEnable: false,
                          height: 60.h,
                          vertical: 19.h,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          length: 3,
                          isPass: true),
                    )
                  ],
                ),
                getVerSpace(20.h),
                Row(
                  children: [
                    GetX<PaymentController>(
                      init: PaymentController(),
                      builder: (controller) => GestureDetector(
                        child: controller.check.value == true
                            ? getSvgImage("check.svg", width: 24.h, height: 24.h)
                            : Container(
                                height: 24.h,
                                width: 24.h,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: borderColor, width: 1.h),
                                    borderRadius: BorderRadius.circular(6.h)),
                              ),
                        onTap: () {
                          controller.onCheck();
                        },
                      ),
                    ),
                    getHorSpace(10.h),
                    getCustomFont("Save Card", 15.sp, Colors.black, 1,
                        fontWeight: FontWeight.w400, txtHeight: 1.53.h)
                  ],
                ),
                getVerSpace(21.h),
                getButton(context, accentColor, "Add", Colors.white, () {
                  Get.back();
                }, 18.sp,
                    weight: FontWeight.w700,
                    buttonHeight: 56.h,
                    borderRadius: BorderRadius.circular(22.h)),
                getVerSpace(40.h)
              ],
            ),
          ),
        )
      ],
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue previousValue,
    TextEditingValue nextValue,
  ) {
    var inputText = nextValue.text;

    if (nextValue.selection.baseOffset == 0) {
      return nextValue;
    }

    var bufferString = StringBuffer();
    for (int i = 0; i < inputText.length; i++) {
      bufferString.write(inputText[i]);
      var nonZeroIndexValue = i + 1;
      if (nonZeroIndexValue % 4 == 0 && nonZeroIndexValue != inputText.length) {
        bufferString.write(' ');
      }
    }

    var string = bufferString.toString();
    return nextValue.copyWith(
      text: string,
      selection: TextSelection.collapsed(
        offset: string.length,
      ),
    );
  }
}
