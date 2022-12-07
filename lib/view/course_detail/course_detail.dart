import 'dart:developer';

import 'package:education_app/view/course_detail/tab_Classes.dart';
import 'package:education_app/view/course_detail/tab_live_classes.dart';
import 'package:education_app/view/course_detail/tab_overview.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../Constants/color_data.dart';
import '../../Constants/constant.dart';
import '../../Constants/widget_utils.dart';
import '../../routes/app_routes.dart';

class CourseDetail extends StatefulWidget {
  final String? courseDuration;
  final String? heading;
  final String? description;
  final String? lessons;
  final String? medium;
  final String? level;
  final List? subjectName;
  const CourseDetail(
      {Key? key,
      this.courseDuration,
      this.description,
      this.heading,
      this.lessons,
      this.medium,
      this.level,
      this.subjectName})
      : super(key: key);

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> with TickerProviderStateMixin {
  void backClick() {
    Constant.backToPrev(context);
  }

  late TabController _tabController;
  late PageController _pController;

  late FlickManager flickManager;

  final YoutubePlayerController videoController = YoutubePlayerController(
    initialVideoId: '-tysrApRtLU',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
      showLiveFullscreenButton: false,
    ),
  );

  @override
  void dispose() {
    _tabController.dispose();
    flickManager.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _pController = PageController();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network(
          "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
        ),
        autoPlay: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("heading: ${widget.heading}", name: "${context.widget}");
    log("description: ${widget.description}", name: "${context.widget}");
    log("subjectName: ${widget.subjectName}", name: "${context.widget}");
    log("lessons: ${widget.lessons}", name: "${context.widget}");
    log("courseDuration: ${widget.courseDuration}", name: "${context.widget}");
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
              getToolBar("Courses", () {
                backClick();
              }),
              getVerSpace(20.h),
              buildVideoView(),
              getVerSpace(12.h),
              buildTabBar(),
              getVerSpace(12.h),
              buildPageView(),
              getVerSpace(30.h),
              buildEnrollButton(context),
              getVerSpace(30.h)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEnrollButton(BuildContext context) {
    return getPaddingWidget(
      EdgeInsets.symmetric(horizontal: 20.h),
      getButton(context, accentColor, "Enroll Now", Colors.white, () {
        Constant.sendToNext(context, Routes.choosePlanRoute);
      }, 18.sp,
          weight: FontWeight.w700, buttonHeight: 56.h, borderRadius: BorderRadius.circular(22.h)),
    );
  }

  Expanded buildPageView() {
    return Expanded(
      flex: 1,
      child: PageView(
        controller: _pController,
        onPageChanged: (value) {
          _tabController.animateTo(value,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
        children: [
          TabOverView(
            heading: widget.heading,
            description: widget.description,
            lessons: widget.lessons,
            courseDuration: widget.courseDuration,
            subjectName: widget.subjectName,
            level: widget.level,
            medium: widget.medium,
          ),
          TabLiveClasses(
            videoController: videoController,
          ),
          TabClasses(),
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
            text: "Overview",
          ),
          Tab(
            text: "Live Classes",
          ),
          Tab(
            text: "Classes",
          ),
        ],
        onTap: (value) {
          _pController.animateToPage(value,
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
      ),
    );
  }

  Container buildVideoView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22.h),
          boxShadow: [
            BoxShadow(color: "#2423408F".toColor(), offset: const Offset(-4, 5), blurRadius: 16.h)
          ]),
      padding: EdgeInsets.all(12.h),
      child: Container(
        height: 195.h,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.h)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.h),
          child: YoutubePlayer(
            controller: videoController,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
            progressColors: const ProgressBarColors(
              playedColor: Colors.amber,
              handleColor: Colors.amberAccent,
            ),
            onReady: () {
              // _controller.addListener(listener);
            },
            // onReady () {
            // _controller.addListener(listener);
            // },
          ),
          /*child: FlickVideoPlayer(
            flickManager: flickManager,
            flickVideoWithControls: const FlickVideoWithControls(
              closedCaptionTextStyle: TextStyle(fontSize: 8),
              controls: FlickPortraitControls(),
            ),
            flickVideoWithControlsFullscreen: const FlickVideoWithControls(
              controls: FlickLandscapeControls(),
            ),
          ),*/
        ),
      ),
    );
  }
}
