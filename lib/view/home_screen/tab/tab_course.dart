import 'package:education_app/Constants/color_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Constants/constant.dart';
import '../../../Constants/widget_utils.dart';

class TabCourse extends StatefulWidget {
  const TabCourse({Key? key}) : super(key: key);

  @override
  State<TabCourse> createState() => _TabCourseState();
}

class _TabCourseState extends State<TabCourse> with TickerProviderStateMixin {
  void backClick() {
    Constant.closeApp();
  }

  late TabController _tabController;
  late PageController _pController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _pController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          getVerSpace(20.h),
          getToolBar("My Courses", () {
            backClick();
          }),
          Spacer(),
          const Center(
            child: Text("No Courses purchased"),
          ),
          Spacer(),
          // getVerSpace(20.h),
          // buildTabBar(),
          // getVerSpace(20.h),
          // Expanded(
          //   flex: 1,
          //   child: PageView(
          //     controller: _pController,
          //     onPageChanged: (value) {
          //       _tabController.animateTo(value,
          //           duration: const Duration(milliseconds: 300), curve: Curves.ease);
          //     },
          //     children: const [OngoingScreen(), CompletedScreen()],
          //   ),
          // ),
        ],
      ),
    );
  }

  Container buildTabBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      height: 54.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.h),
          boxShadow: [
            BoxShadow(color: "#2423408F".toColor(), blurRadius: 16.h, offset: const Offset(-4, 5))
          ]),
      child: TabBar(
        unselectedLabelColor: subtextColor,
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 7.h),
        labelStyle: TextStyle(
            fontSize: 15.sp, fontWeight: FontWeight.w700, fontFamily: Constant.fontsFamily),
        labelColor: accentColor,
        unselectedLabelStyle: TextStyle(
            fontSize: 15.sp, fontWeight: FontWeight.w700, fontFamily: Constant.fontsFamily),
        indicator: ShapeDecoration(
            color: lightAccent,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.h))),
        controller: _tabController,
        tabs: const [
          Tab(
            text: "Ongoing",
          ),
          Tab(
            text: "Completed",
          ),
        ],
        onTap: (value) {
          _pController.animateToPage(value,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
      ),
    );
  }
}
