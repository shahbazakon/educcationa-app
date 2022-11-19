import 'package:education_app/Constants/color_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../Constants/constant.dart';
import '../../Constants/widget_utils.dart';
import '../../controller/controller.dart';
import '../../data/data_file.dart';
import '../../dialog/filter_dialog.dart';
import '../../model/model_category.dart';
import '../../model/model_recent.dart';
import '../../model/model_trending.dart';
import '../../routes/app_routes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchController controller = Get.put(SearchController());
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  List<ModelCategory> categoryLists = DataFile.categoryList;

  @override
  Widget build(BuildContext context) {
    void backClick() {
      Constant.backToPrev(context);
    }

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
              getVerSpace(20.h),
              getPaddingWidget(
                  EdgeInsets.symmetric(horizontal: 20.h),
                  GestureDetector(
                      onTap: () {
                        backClick();
                      },
                      child: getSvgImage("arrow_left.svg", width: 24.h, height: 24.h))),
              getVerSpace(20.h),
              buildSearchWidget(context),
              getVerSpace(20.h),
              Expanded(
                  flex: 1,
                  child: ListView(
                    primary: true,
                    shrinkWrap: true,
                    children: [
                      buildCategory(),
                      getVerSpace(20.h),
                      buildCategoryList(),
                      getVerSpace(20.h),
                      buildTrendingCourseList(),
                      buildRecentAddCourseList()
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  GetBuilder<HomeScreenController> buildRecentAddCourseList() {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) => ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        primary: false,
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          ModelRecent modelRecent = controller.recentLists[index];
          return GestureDetector(
            onTap: () {
              Constant.sendToNext(context, Routes.courseDetailRoute);
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 20.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.h),
                  boxShadow: [
                    BoxShadow(
                        color: "#2423408F".toColor(), blurRadius: 16.h, offset: const Offset(-4, 5))
                  ]),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image:
                                AssetImage(Constant.assetImagePath + modelRecent.image.toString()),
                            fit: BoxFit.fill)),
                    height: 210.h,
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(top: 10.19.h, left: 7.16.h),
                    child: Row(
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 32.h,
                            width: 32.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.h),
                                boxShadow: [
                                  BoxShadow(
                                      color: '#0D000000'.toColor(),
                                      offset: const Offset(0, 2.67),
                                      blurRadius: 5.33.h)
                                ]),
                            padding: EdgeInsets.all(8.h),
                            child: getSvgImage(controller.recentLists[index].select == true
                                ? "save_bold.svg"
                                : "save.svg"),
                          ),
                          onTap: () {
                            controller.selectRecent(index);
                          },
                        ),
                        getHorSpace(7.84.h),
                        GestureDetector(
                          child: Container(
                            height: 32.h,
                            width: 32.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.h),
                                boxShadow: [
                                  BoxShadow(
                                      color: '#0D000000'.toColor(),
                                      offset: const Offset(0, 2.67),
                                      blurRadius: 5.33.h)
                                ]),
                            padding: EdgeInsets.all(8.h),
                            child: getSvgImage("share.svg"),
                          ),
                          onTap: () {
                            Share.share('check out my website https://example.com',
                                subject: 'Look what I made!');
                          },
                        ),
                      ],
                    ),
                  ),
                  getVerSpace(10.h),
                  getPaddingWidget(
                    EdgeInsets.symmetric(horizontal: 10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: '#FAF4E1'.toColor(),
                                  borderRadius: BorderRadius.circular(12.h)),
                              padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 4.h),
                              child: Row(
                                children: [
                                  getSvgImage("rating_fill.svg", width: 17.h, height: 17.h),
                                  getHorSpace(6.h),
                                  getCustomFont(
                                      modelRecent.rating.toString(), 15.sp, yellowColor, 1,
                                      fontWeight: FontWeight.w400)
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                getSvgImage("clock.svg", height: 17.h, width: 17.h),
                                getHorSpace(4.h),
                                getCustomFont(modelRecent.time ?? "", 15.sp, Colors.black, 1,
                                    fontWeight: FontWeight.w400)
                              ],
                            )
                          ],
                        ),
                        getVerSpace(11.h),
                        getMultilineCustomFont(modelRecent.name ?? "", 15.sp, Colors.black,
                            fontWeight: FontWeight.w700,
                            txtHeight: 1.53.h,
                            textAlign: TextAlign.start),
                        getVerSpace(11.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                getAssetImage(modelRecent.personImage ?? "",
                                    width: 40.h, height: 40.h),
                                getHorSpace(10.h),
                                getCustomFont(modelRecent.person ?? "", 15.sp, accentColor, 1,
                                    fontWeight: FontWeight.w400)
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: lightAccent, borderRadius: BorderRadius.circular(12.h)),
                              padding: EdgeInsets.all(3.h),
                              child: getCustomFont("\$${modelRecent.price}", 20.sp, accentColor, 1,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        getVerSpace(10.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  GetBuilder<HomeScreenController> buildTrendingCourseList() {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) => GridView.builder(
          primary: false,
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 20.h, right: 20.h, bottom: 20.h),
          itemCount: 1,
          itemBuilder: (context, index) {
            ModelTrending modelTrending = controller.trendingLists[index];
            return GestureDetector(
              onTap: () {
                Constant.sendToNext(context, Routes.courseDetailRoute);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.h),
                    boxShadow: [
                      BoxShadow(
                          color: '#2423408F'.toColor(),
                          offset: const Offset(-4, 5),
                          blurRadius: 16.h)
                    ]),
                child: Column(
                  children: [
                    Container(
                      height: 165.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  Constant.assetImagePath + modelTrending.image.toString()),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(12.h)),
                      padding: EdgeInsets.only(left: 10.h, top: 10.h, right: 150.w, bottom: 135.h),
                      child: GestureDetector(
                        onTap: () {
                          controller.selectChange(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.h),
                              boxShadow: [
                                BoxShadow(
                                    color: '#2423408F'.toColor(),
                                    offset: const Offset(-4, 5),
                                    blurRadius: 16.h)
                              ]),
                          padding: const EdgeInsets.all(3),
                          child: getSvgImage(controller.trendingLists[index].select == true
                              ? "save_bold.svg"
                              : "save.svg"),
                        ),
                      ),
                    ),
                    getVerSpace(6.h),
                    getPaddingWidget(
                      EdgeInsets.symmetric(horizontal: 6.h),
                      Column(
                        children: [
                          SizedBox(
                            height: 46.h,
                            child: getMultilineCustomFont(
                                modelTrending.name ?? "", 15.sp, Colors.black,
                                fontWeight: FontWeight.w700,
                                txtHeight: 1.53.h,
                                textAlign: TextAlign.start),
                          ),
                          getVerSpace(12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: "#FAF4E1".toColor(),
                                    borderRadius: BorderRadius.circular(12.h)),
                                padding: EdgeInsets.symmetric(horizontal: 4.h, vertical: 5.5.h),
                                child: Row(
                                  children: [
                                    getSvgImage("rating_fill.svg", width: 15.h, height: 15.h),
                                    getHorSpace(6.h),
                                    getCustomFont(
                                        modelTrending.rating.toString(), 14.sp, yellowColor, 1,
                                        fontWeight: FontWeight.w500)
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  getSvgImage("clock.svg", width: 17.h, height: 17.h),
                                  getHorSpace(4.h),
                                  getCustomFont(modelTrending.time ?? "", 14.sp, Colors.black, 1,
                                      fontWeight: FontWeight.w500)
                                ],
                              )
                            ],
                          ),
                          getVerSpace(10.h),
                          Row(
                            children: [
                              getAssetImage(modelTrending.personImage ?? "",
                                  height: 30.h, width: 30.h),
                              getHorSpace(6.h),
                              getCustomFont(modelTrending.person ?? '', 14.sp, accentColor, 1,
                                  fontWeight: FontWeight.w500)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 302.h,
              mainAxisSpacing: 20.h,
              crossAxisSpacing: 18.h)),
    );
  }

  GetBuilder<HomeScreenController> buildCategory() {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) => getPaddingWidget(
        EdgeInsets.symmetric(horizontal: 20.h),
        Wrap(
          alignment: WrapAlignment.start,
          children: [
            for (final i in List.generate(3, (index) => index))
              getPaddingWidget(
                  EdgeInsets.only(right: 25.6.h, bottom: 13.h),
                  GestureDetector(
                    onTap: () {
                      if (!controller.selectedCategory.contains(controller.categoryList[i])) {
                        controller.addItem(i);
                      } else {
                        controller.removeItem(i);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 12.h),
                      decoration: BoxDecoration(
                          color: controller.selectedCategory.contains(controller.categoryList[i])
                              ? lightAccent
                              : Colors.white,
                          borderRadius: BorderRadius.circular(6.h),
                          border: controller.selectedCategory.contains(controller.categoryList[i])
                              ? null
                              : Border.all(color: borderColor, width: 1.h)),
                      child: getCustomFont(
                          controller.categoryList[i],
                          15.sp,
                          controller.selectedCategory.contains(controller.categoryList[i])
                              ? accentColor
                              : subtextColor,
                          1,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                          txtHeight: 1.53.h),
                    ),
                  ))
          ],
        ),
      ),
    );
  }

  SizedBox buildCategoryList() {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: categoryLists.length,
        itemBuilder: (context, index) {
          ModelCategory modelCategory = categoryLists[index];
          return Container(
            margin: EdgeInsets.only(right: 12.h, left: index == 0 ? 20.h : 0),
            width: 110.h,
            decoration: BoxDecoration(
                color: modelCategory.color!.toColor(), borderRadius: BorderRadius.circular(22.h)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                getSvgImage(modelCategory.image ?? ""),
                getVerSpace(17.h),
                getCustomFont(modelCategory.name ?? "", 14.sp, Colors.black, 1,
                    fontWeight: FontWeight.w700, txtHeight: 1.5.h)
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildSearchWidget(BuildContext context) {
    return getPaddingWidget(
      EdgeInsets.symmetric(horizontal: 20.h),
      getSearchWidget(
        context,
        "Search",
        controller.searchController,
        isEnable: false,
        isprefix: true,
        prefix: Row(
          children: [
            getHorSpace(18.h),
            getSvgImage("search.svg", height: 24.h, width: 24.h),
          ],
        ),
        constraint: BoxConstraints(maxHeight: 24.h, maxWidth: 55.h),
        withSufix: true,
        suffiximage: "filter.svg",
        imagefunction: () {
          showModalBottomSheet(
            backgroundColor: Colors.white,
            isScrollControlled: true,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(22.h),
              ),
            ),
            builder: (context) {
              return const FilterDialog();
            },
          );
        },
      ),
    );
  }
}
