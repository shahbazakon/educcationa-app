import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../Constants/constant.dart';
import '../Constants/widget_utils.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  void backClick() {
    Constant.backToPrev(context);
  }

  late FlickManager flickManager;

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  void initState() {
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      ),
    );
    super.initState();
  }

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
              AppBar(
                toolbarHeight: 36.h,
                backgroundColor: Colors.white,
                elevation: 0,
                leading: getPaddingWidget(
                    EdgeInsets.symmetric(vertical: 6.h),
                    GestureDetector(
                        onTap: () {
                          backClick();
                        },
                        child: getSvgImage("arrow_left.svg", height: 24.h, width: 24.h))),
              ),
              getVerSpace(95.h),
              SizedBox(
                height: 345.h,
                width: double.infinity,
                child: FlickVideoPlayer(
                  flickManager: flickManager,
                  flickVideoWithControls: const FlickVideoWithControls(
                    closedCaptionTextStyle: TextStyle(fontSize: 8),
                    controls: FlickPortraitControls(),
                  ),
                  flickVideoWithControlsFullscreen: const FlickVideoWithControls(
                    controls: FlickLandscapeControls(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
