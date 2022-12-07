import 'dart:io';

import 'package:flutter/material.dart';

Widget addVerticalSpace(BuildContext context, double height) {
  return SizedBox(height: MediaQuery.of(context).size.height * height);
}

Widget addHorizontalSpace(BuildContext context, double width) {
  return SizedBox(width: MediaQuery.of(context).size.width * width);
}

/// ---------------------------------------------------- TODO: Test to dynamic size
var navigatorKey = GlobalKey<NavigatorState>();

class MathUtilities {
  static screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  static safeAreaTopHeight(BuildContext context) => MediaQuery.of(context).padding.top;

  static safeAreaBottomHeight(BuildContext context) => MediaQuery.of(context).padding.bottom;

  static get isAndroidDevice => (Platform.isAndroid);

  static get isiOSDevice => (Platform.isIOS);

  static bool isPad(BuildContext context) =>
      (MediaQuery.of(context).size.shortestSide < 600) ? false : true;
}

dynamic getSize(double px) {
  return px * (MathUtilities.screenWidth(navigatorKey.currentState!.overlay!.context) / 375);
}

dynamic getFontSize(double px) {
  return (px) * (MathUtilities.screenWidth(navigatorKey.currentState!.overlay!.context) / 375);
}
