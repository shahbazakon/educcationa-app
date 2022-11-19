import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Constants/color_data.dart';
import '../../../Constants/constant.dart';
import '../../../Constants/widget_utils.dart';
import '../../../controller/controller.dart';
import '../../../data/data_file.dart';
import '../../../dialog/filter_dialog.dart';
import '../../../model/model_category.dart';
import '../../../model/model_home_slider.dart';
import '../../../model/model_recent.dart';
import '../../../model/model_trending.dart';
import '../../../routes/app_routes.dart';

class TabHome extends StatefulWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  HomeScreenController controller = Get.put(HomeScreenController());
  List<ModelHomeSlider> homeSliderLists = DataFile.homeSliderList;
  List<ModelCategory> categoryLists = DataFile.categoryList;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          getVerSpace(16.h),
          buildAppBar(),
          getVerSpace(30.h),
          buildSearchWidget(context),
          getVerSpace(20.h),
          Expanded(
              flex: 1,
              child: ListView(
                primary: true,
                shrinkWrap: true,
                children: [
                  buildSliderList(),
                  getVerSpace(20.h),
                  buildSliderIndicator(),
                  getVerSpace(20.h),
                  buildCategoryList(),
                  getVerSpace(20.h),
                  buildTrendingList(),
                  getVerSpace(20.h),
                  buildRecentCourseList()
                ],
              ))
        ],
      ),
    );
  }

  Column buildRecentCourseList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getPaddingWidget(
          EdgeInsets.symmetric(horizontal: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getCustomFont("Recently Add Course", 18.sp, Colors.black, 1,
                  fontWeight: FontWeight.w700, txtHeight: 1.5.h),
              GestureDetector(
                onTap: () {
                  Constant.sendToNext(context, Routes.recentCourseListRoute);
                },
                child: getCustomFont("See All", 18.sp, accentColor, 1,
                    fontWeight: FontWeight.w700, txtHeight: 1.5.h),
              )
            ],
          ),
        ),
        getVerSpace(16.h),
        GetBuilder<HomeScreenController>(
          init: HomeScreenController(),
          builder: (controller) => SizedBox(
            height: 363.h,
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: controller.recentLists.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                ModelRecent modelRecent = controller.recentLists[index];
                return GestureDetector(
                  onTap: () {
                    Constant.sendToNext(context, Routes.courseDetailRoute);
                  },
                  child: Container(
                    width: 276.h,
                    margin: EdgeInsets.only(right: 16.h, left: index == 0 ? 20.h : 0, bottom: 40.h),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.h),
                        boxShadow: [
                          BoxShadow(
                              color: '#2423408F'.toColor(),
                              blurRadius: 16.h,
                              offset: const Offset(-4, 5))
                        ]),
                    child: Column(
                      children: [
                        Container(
                          height: 158.h,
                          width: 276.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.h),
                              image: DecorationImage(
                                  image: AssetImage(
                                      Constant.assetImagePath + modelRecent.image.toString()),
                                  fit: BoxFit.fill)),
                          padding:
                              EdgeInsets.only(left: 10.h, top: 10.h, right: 246.h, bottom: 128.h),
                          child: GestureDetector(
                            onTap: () {
                              controller.selectRecent(index);
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
                              child: getSvgImage(controller.recentLists[index].select == true
                                  ? "save_bold.svg"
                                  : "save.svg"),
                            ),
                          ),
                        ),
                        getVerSpace(10.h),
                        getPaddingWidget(
                          EdgeInsets.symmetric(horizontal: 10.h),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: "#FAF4E1".toColor(),
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
                                      getSvgImage("clock.svg", width: 17.h, height: 17.h),
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
                                          height: 40.h, width: 40.h),
                                      getHorSpace(10.h),
                                      getCustomFont(
                                        modelRecent.person ?? "",
                                        15.sp,
                                        accentColor,
                                        1,
                                        fontWeight: FontWeight.w400,
                                      )
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: lightAccent,
                                      borderRadius: BorderRadius.circular(12.h),
                                    ),
                                    padding: EdgeInsets.all(3.h),
                                    child: getCustomFont(
                                        "\$${modelRecent.price}", 20.sp, accentColor, 1,
                                        fontWeight: FontWeight.w700),
                                  )
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
            ),
          ),
        )
      ],
    );
  }

  Column buildTrendingList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        getPaddingWidget(
          EdgeInsets.symmetric(horizontal: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getCustomFont("Trending Course", 18.sp, Colors.black, 1,
                  fontWeight: FontWeight.w700, txtHeight: 1.5.h),
              GestureDetector(
                onTap: () {
                  Constant.sendToNext(context, Routes.trendingListRoute);
                },
                child: getCustomFont("See All", 18.sp, accentColor, 1,
                    fontWeight: FontWeight.w700, txtHeight: 1.5.h),
              )
            ],
          ),
        ),
        getVerSpace(16.h),
        GetBuilder<HomeScreenController>(
          init: HomeScreenController(),
          builder: (controller) => SizedBox(
            height: 234.h,
            child: ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: controller.trendingLists.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                ModelTrending modelTrending = controller.trendingLists[index];
                return GestureDetector(
                  onTap: () {
                    Constant.sendToNext(context, Routes.courseDetailRoute);
                  },
                  child: Container(
                    width: 177.h,
                    margin: EdgeInsets.only(right: 16.h, left: index == 0 ? 20.h : 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 172.h,
                          width: 177.h,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      Constant.assetImagePath + modelTrending.image.toString()),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(12.h)),
                          padding:
                              EdgeInsets.only(left: 10.h, top: 10.h, right: 147.h, bottom: 142.h),
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
                        getVerSpace(8.h),
                        getMultilineCustomFont(modelTrending.name ?? '', 15.sp, Colors.black,
                            fontWeight: FontWeight.w700, txtHeight: 1.53.h)
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
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

  GetBuilder<HomeScreenController> buildSliderIndicator() {
    return GetBuilder<HomeScreenController>(
      init: HomeScreenController(),
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          homeSliderLists.length,
          (position) {
            return getPaddingWidget(
                EdgeInsets.only(left: position == 0 ? 0 : 6.h, right: 6.h),
                getSvgImage(position == controller.index.value ? "select_dot.svg" : "dot.svg",
                    height: 10.h, width: 10.h));
          },
        ),
      ),
    );
  }

  CarouselSlider buildSliderList() {
    return CarouselSlider.builder(
        itemCount: homeSliderLists.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          ModelHomeSlider modelHome = homeSliderLists[itemIndex];
          return Container(
            height: 150.h,
            width: 322.w,
            decoration: BoxDecoration(
                color: modelHome.color!.toColor(), borderRadius: BorderRadius.circular(22.h)),
            padding: EdgeInsets.only(left: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: getPaddingWidget(
                    EdgeInsets.symmetric(vertical: 20.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: getMultilineCustomFont(modelHome.name ?? "", 18.sp, Colors.black,
                              fontWeight: FontWeight.w700, txtHeight: 1.5.h),
                        ),
                        getCustomFont("Get Start", 18.sp, accentColor, 1,
                            fontWeight: FontWeight.w700, txtHeight: 1.5.h)
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 160.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Constant.assetImagePath + modelHome.image.toString()),
                          fit: BoxFit.fill)),
                )
              ],
            ),
          );
        },
        options: CarouselOptions(
            height: 150,
            viewportFraction: 0.85,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: false,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
            onPageChanged: (index, reason) {
              controller.indexChange(index.obs);
            }));
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
          withSufix: true,
          suffiximage: "filter.svg", imagefunction: () {
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
      }, onTap: () {
        Constant.sendToNext(context, Routes.searchScreenRoute);
      }, isReadonly: true),
    );
  }

  Widget buildAppBar() {
    return getPaddingWidget(
      EdgeInsets.symmetric(horizontal: 20.h),
      Row(
        children: [
          getAssetImage("profile_icon.png", width: 50.h, height: 50.h),
          getHorSpace(10.49.h),
          getCustomFont("Welcome,Kevin", 22.sp, Colors.black, 1,
              fontWeight: FontWeight.w700, textAlign: TextAlign.start)
        ],
      ),
    );
  }
}
