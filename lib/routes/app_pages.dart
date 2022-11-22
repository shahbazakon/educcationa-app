import 'package:flutter/material.dart';

import '../my_course/my_course_detail.dart';
import '../my_course/video_screen.dart';
import '../view/course_detail/choose_plan.dart';
import '../view/course_detail/course_detail.dart';
import '../view/home_screen/home_screen.dart';
import '../view/intro/intro_screen.dart';
import '../view/login/login_screen.dart';
import '../view/login/reset_password_screen.dart';
import '../view/login/select_country_screen.dart';
import '../view/payment/payment_screen.dart';
import '../view/profile_payment/card_screen.dart';
import '../view/search/search_screen.dart';
import '../view/signup/phone_number_screen.dart';
import '../view/signup/signup_screen.dart';
import '../view/signup/term_and_condition_screen.dart';
import '../view/signup/verificationScreen.dart';
import '../view/splash_screen.dart';
import '../view/trending_screen/trending_list.dart';
import 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.homeRoute;
  static Map<String, WidgetBuilder> routes = {
    Routes.homeRoute: (context) => const SplashScreen(),
    Routes.homeScreenRoute: (context) => const HomeScreen(),
    Routes.introScreenRoute: (context) => const IntroScreen(),
    Routes.paymentRoute: (context) => const PaymentScreen(),
    Routes.loginScreenRoute: (context) => const LoginScreen(),
    Routes.selectCountryRoute: (context) => const SelectCountryScreen(),
    Routes.resetPasswordRoute: (context) => const ResetPasswordScreen(),
    Routes.signUpScreenRoute: (context) => const SignUpScreen(),
    Routes.phoneNumberScreenRoute: (context) => const PhoneNumberScreen(),
    Routes.verificationRoute: (context) => const VerificationScreen(),
    Routes.termConditionRoute: (context) => const TermConditionScreen(),
    Routes.searchScreenRoute: (context) => const SearchScreen(),
    Routes.courseDetailRoute: (context) => const CourseDetail(),
    Routes.choosePlanRoute: (context) => const ChoosePlan(),
    Routes.myCourseDetailRoute: (context) => const MyCourseDetail(),
    Routes.videoScreenRoute: (context) => const VideoScreen(),
    Routes.trendingListRoute: (context) => const TrendingList(),
    Routes.cardScreenRoute: (context) => const CardScreen(),
  };
}
