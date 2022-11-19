import 'package:flutter/material.dart';

import '../UI/home.dart';
import '../my_course/my_course_detail.dart';
import '../my_course/video_screen.dart';
import '../view/course_detail/choose_plan.dart';
import '../view/course_detail/course_detail.dart';
import '../view/intro/intro_screen.dart';
import '../view/login/forgot_screen.dart';
import '../view/login/login_screen.dart';
import '../view/login/reset_password_screen.dart';
import '../view/login/select_country_screen.dart';
import '../view/search/search_screen.dart';
import '../view/signup/phone_number_screen.dart';
import '../view/signup/signup_screen.dart';
import '../view/signup/term_and_condition_screen.dart';
import '../view/signup/verificationScreen.dart';
import '../view/splash_screen.dart';
import 'app_routes.dart';

class AppPages {
  static const initialRoute = Routes.homeRoute;
  static Map<String, WidgetBuilder> routes = {
    Routes.homeRoute: (context) => const SplashScreen(),
    Routes.homeScreenRoute: (context) => const HomeScreen(),
    Routes.introScreenRoute: (context) => const IntroScreen(),
    Routes.loginScreenRoute: (context) => const LoginScreen(),
    Routes.forgotScreenRoute: (context) => const ForgotScreen(),
    Routes.selectCountryRoute: (context) => const SelectCountryScreen(),
    Routes.resetPasswordRoute: (context) => const ResetPasswordScreen(),
    Routes.signUpScreenRoute: (context) => const SignUpScreen(),
    Routes.phoneNumberScreenRoute: (context) => const PhoneNumberScreen(),
    Routes.verificationRoute: (context) => const VerificationScreen(),
    Routes.termConditionRoute: (context) => const TermConditionScreen(),
    // Routes.trendingListRoute: (context) => const TrendingList(),
    // Routes.recentCourseListRoute: (context) => const RecentCourseList(),
    Routes.searchScreenRoute: (context) => const SearchScreen(),
    Routes.courseDetailRoute: (context) => const CourseDetail(),
    Routes.choosePlanRoute: (context) => const ChoosePlan(),
    // Routes.paymentRoute: (context) => const PaymentScreen(),
    Routes.myCourseDetailRoute: (context) => const MyCourseDetail(),
    Routes.videoScreenRoute: (context) => const VideoScreen(),
    // Routes.chatScreenRoute: (context) => const ChatScreen(),
    // Routes.editProfileRoute: (context) => const EditProfile(),
    // Routes.certificationRoute: (context) => const CertificationScreen(),
    // Routes.cardScreenRoute: (context) => const CardScreen(),
    // Routes.privacyPolicyRoute: (context) => const PrivacyPolicyScreen(),
    // Routes.feedbackRoute: (context) => const FeedbackScreen(),
    // Routes.helpCenterRoute: (context) => const HelpCenterScreen(),
    // Routes.savedCourseRoute: (context) => const SavedCourseScreen()
  };
}
