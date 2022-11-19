import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learn_management_app_ui/app/controller/controller.dart';
import 'package:learn_management_app_ui/app/data/data_file.dart';
import 'package:learn_management_app_ui/app/routes/app_routes.dart';
import 'package:learn_management_app_ui/base/color_data.dart';
import 'package:learn_management_app_ui/base/constant.dart';
import 'package:learn_management_app_ui/base/widget_utils.dart';

import '../../../model/model_chat.dart';

class TabChat extends StatefulWidget {
  const TabChat({Key? key}) : super(key: key);

  @override
  State<TabChat> createState() => _TabChatState();
}

class _TabChatState extends State<TabChat> {
  ChatController controller = Get.put(ChatController());
  List<ModelChat> chatLists = DataFile.chatList;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          getVerSpace(20.h),
          buildSearchWidget(context),
          getVerSpace(20.h),
          Container(
            height: 50.h,
            margin: EdgeInsets.symmetric(horizontal: 42.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: List.generate(chatLists.length, (index) {
                ModelChat modelChat = chatLists[index];
                return Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Constant.sendToNext(context, Routes.chatScreenRoute);
                      },
                      child: Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          getAssetImage(modelChat.image ?? '',
                              height: 50.h, width: 50.h),
                          Positioned(
                            right: 2.h,
                            bottom: 3.h,
                            child: Container(
                              height: 10.h,
                              width: 10.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.h),
                                  color: greenColor),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              }),
            ),
          ),
          getVerSpace(30.h),
          Expanded(
              flex: 1,
              child: GetBuilder<ChatController>(
                init: ChatController(),
                builder: (controller) => ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: controller.chatLists.length,
                  itemBuilder: (context, index) {
                    ModelChat modelChat = controller.chatLists[index];
                    return GestureDetector(
                      onTap: (){
                        Constant.sendToNext(context, Routes.chatScreenRoute);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20.h),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.h),
                            boxShadow: [
                              BoxShadow(
                                  color: "#2423408F".toColor(),
                                  offset: const Offset(-4, 5),
                                  blurRadius: 16.h)
                            ]),
                        padding: EdgeInsets.all(10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    getAssetImage(modelChat.image ?? '',
                                        height: 50.h, width: 50.h),
                                    Positioned(
                                      right: 2.h,
                                      bottom: 3.h,
                                      child: Container(
                                        height: 10.h,
                                        width: 10.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.h),
                                            color: greenColor),
                                      ),
                                    )
                                  ],
                                ),
                                getHorSpace(15.h),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    getCustomFont(modelChat.name ?? "", 14.sp,
                                        Colors.black, 1,
                                        fontWeight: FontWeight.w700,
                                        txtHeight: 1.5.h),
                                    getVerSpace(2.h),
                                    getCustomFont(modelChat.chat ?? "", 12.sp,
                                        subtextColor, 1,
                                        fontWeight: FontWeight.w500,
                                        txtHeight: 1.5.h)
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                getCustomFont(
                                    modelChat.time ?? "", 12.sp, Colors.black, 1,
                                    fontWeight: FontWeight.w500,
                                    txtHeight: 1.5.h),
                                getVerSpace(4.h),
                                modelChat.notification == "0"
                                    ? Container()
                                    : Container(
                                        height: 16.h,
                                        width: 16.h,
                                        decoration: BoxDecoration(
                                            color: accentColor,
                                            borderRadius:
                                                BorderRadius.circular(20.h)),
                                        alignment: Alignment.center,
                                        child: getCustomFont(
                                            modelChat.notification ?? "",
                                            9.sp,
                                            Colors.white,
                                            1,
                                            fontWeight: FontWeight.w500),
                                      )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ))
        ],
      ),
    );
  }

  Widget buildSearchWidget(BuildContext context) {
    return getPaddingWidget(
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
    );
  }
}
