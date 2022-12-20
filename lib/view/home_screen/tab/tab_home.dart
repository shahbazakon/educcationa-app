import 'dart:developer';

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
import '../../../model/model_trending.dart';
import '../../../routes/app_routes.dart';
import '../../../services/API Services/cources_services.dart';
import '../../../utils/assets_path.dart';
import '../../course_detail/course_detail.dart';

class TabHome extends StatefulWidget {
  const TabHome({Key? key}) : super(key: key);

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  HomeScreenController controller = Get.put(HomeScreenController());
  List<ModelHomeSlider> homeSliderLists = DataFile.homeSliderList;
  List<ModelCategory> categoryLists = DataFile.categoryList;
  List<dynamic> addCourses = [];
  List<String> bannerListImage = DataFile.bannerImageList;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
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
                children: [
                  buildSliderList(),
                  getVerSpace(20.h),
                  buildSliderIndicator(),
                  getVerSpace(20.h),
                  buildCategoryList(),
                  getVerSpace(20.h),
                  buildTrendingList(),
                ],
              ))
        ],
      ),
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
        FutureBuilder(
          future: CoursesServices().getAddCourse(context),
          builder: (context, snapshot) {
            log("snapshot.hasData: ${snapshot.hasData}");
            log("snapshot.data: ${snapshot.data}");
            if (snapshot.hasData == false) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            addCourses = snapshot.data as List;
            return GetBuilder<HomeScreenController>(
              init: HomeScreenController(),
              builder: (controller) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: .82,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: addCourses.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    ModelTrending modelTrending = controller.trendingLists[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CourseDetail(
                                      heading: addCourses[index]["heading"],
                                      lessons: addCourses[index]["lessons"],
                                      description: addCourses[index]["description"],
                                      courseDuration: addCourses[index]["courseDuration"],
                                      level: addCourses[index]["level"],
                                      medium: addCourses[index]["medium"],
                                      subjectName: addCourses[index]["subjectName"],
                                    )));
                        // Constant.sendToNext(context, Routes.courseDetailRoute);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 172.h,
                            width: 177.h,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(addCourses[index]["image"]),
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
                          getMultilineCustomFont(
                              addCourses[index]["courseName"] ?? '', 15.sp, Colors.black,
                              fontWeight: FontWeight.w700, txtHeight: 1.53.h)
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
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
          return GestureDetector(
            onTap: () {
              Constant.sendToNext(context, Routes.trendingListRoute);
            },
            child: Container(
              margin: EdgeInsets.only(right: 12.h, left: index == 0 ? 20.h : 0),
              width: 110.h,
              decoration: BoxDecoration(
                  color: modelCategory.color!.toColor(), borderRadius: BorderRadius.circular(22.h)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(height: 60.h, modelCategory.image ?? ""),
                  getVerSpace(5.h),
                  getCustomFont(modelCategory.name ?? "", 14.sp, Colors.black, 1,
                      fontWeight: FontWeight.w700, txtHeight: 1.5.h)
                ],
              ),
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
        itemCount: bannerListImage.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          ModelHomeSlider modelHome = homeSliderLists[itemIndex];
          log("modelHome.image.toString(): ${modelHome.image.toString()}");
          log("AppAssets.image1: ${AppAssets.image1}");
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 150.h,
              width: 300.w,
              child: Image.asset(bannerListImage[itemIndex], fit: BoxFit.cover),
            ),
          );

          // return Container(
          //   height: 150.h,
          //   width: 322.w,
          //   decoration: BoxDecoration(
          //       color: modelHome.color!.toColor(), borderRadius: BorderRadius.circular(22.h)),
          //   padding: EdgeInsets.only(left: 20.h),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Expanded(
          //         child: getPaddingWidget(
          //           EdgeInsets.symmetric(vertical: 20.h),
          //           Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //             children: [
          //               Expanded(
          //                 flex: 1,
          //                 child: getMultilineCustomFont(modelHome.name ?? "", 18.sp, Colors.black,
          //                     fontWeight: FontWeight.w700, txtHeight: 1.5.h),
          //               ),
          //               getCustomFont("Get Start", 18.sp, accentColor, 1,
          //                   fontWeight: FontWeight.w700, txtHeight: 1.5.h)
          //             ],
          //           ),
          //         ),
          //       ),
          //       Container(
          //         width: 160.h,
          //         decoration: BoxDecoration(
          //             image: DecorationImage(
          //                 image: AssetImage(modelHome.image.toString()), fit: BoxFit.fill)),
          //       )
          //     ],
          //   ),
          // );
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
          getAssetImage("chat5.png", width: 50.h, height: 50.h),
          getHorSpace(10.49.h),
          getCustomFont("Welcome,Abhishek", 22.sp, Colors.black, 1,
              fontWeight: FontWeight.w700, textAlign: TextAlign.start)
        ],
      ),
    );
  }
}
