// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Constants/constant.dart';
import '../Constants/pref_data.dart';
import '../Constants/widget_utils.dart';
import '../routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _getIsFirst();
  }

  _getIsFirst() async {
    bool isIntro = await PrefData.getIsIntro();
    bool isSignIn = await PrefData.getIsSignIn();

    if (isIntro) {
      Constant.sendToNext(context, Routes.introScreenRoute);
    } else if (!isSignIn) {
      Constant.sendToNext(context, Routes.loginScreenRoute);
    } else {
      Timer(const Duration(seconds: 3), () {
        Constant.sendToNext(context, Routes.homeScreenRoute);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeScreenSize(context);
    return Scaffold(
      appBar: getColorStatusBar(Colors.white),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            getAssetImage("splash_logo.png", width: 95.h, height: 95.h),
            getVerSpace(20.h),
            getAssetImage("splash_text.png", width: 255.h, height: 34.h)
          ],
        ),
      ),
    );
  }
}
