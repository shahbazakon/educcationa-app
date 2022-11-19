// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/data_file.dart';
import '../model/model_card.dart';
import '../model/model_chat.dart';
import '../model/model_country.dart';
import '../model/model_faq.dart';
import '../model/model_lesson.dart';
import '../model/model_recent.dart';
import '../model/model_trending.dart';

class IntroController extends GetxController {
  var pageController;
  ValueNotifier selectedPage = ValueNotifier(0);
  RxInt select = 0.obs;

  change(RxInt index) {
    select.value = index.value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    pageController.disclose;
  }
}

class LoginController extends GetxController {
  var emailController;
  var passwordController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    emailController.disclose;
    passwordController.disclose;
  }
}

class ForgotController extends GetxController {
  var phoneController;
  var searchController;
  RxString image = "flag.png".obs;
  RxString code = "+1".obs;
  RxBool check = false.obs;
  List<ModelCountry> newCountryLists = DataFile.countryList;

  onItemChanged(String value) {
    newCountryLists = DataFile.countryList
        .where((string) => string.name!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    update();
  }

  getImage(String value, String value1) {
    image.value = value;
    code.value = value1;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    phoneController = TextEditingController();
    searchController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    phoneController.disclose;
    searchController.disclose;
  }
}

class ResetController extends GetxController {
  var passwordController;
  var confirmPasswordController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    passwordController.disclose;
    confirmPasswordController.disclose;
  }
}

class SignUpController extends GetxController {
  var nameController;
  var emailController;
  var passwordController;
  var confirmPasswordController;
  RxBool check = false.obs;

  onCheck() {
    check.value = check.value == true ? false : true;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nameController.disclose;
    emailController.disclose;
    passwordController.disclose;
    confirmPasswordController.disclose;
  }
}

class HomeController extends GetxController {
  RxInt index = 0.obs;

  onChange(RxInt value) {
    index.value = value.value;
    update();
  }
}

class HomeScreenController extends GetxController {
  var searchController;
  RangeValues values = const RangeValues(25, 50);
  RxDouble rating = 3.0.obs;
  List<String> categoryList = [
    "UI/UX",
    "Coding",
    "Game",
    "3D Design",
    "Illustrator",
    "Marketing",
    "Business"
  ];
  List<String> selectedCategory = [];
  RxInt index = 0.obs;
  List<ModelTrending> trendingLists = DataFile.trendingList;
  List<ModelRecent> recentLists = DataFile.recentList;

  selectRecent(int index) {
    if (recentLists[index].select == false) {
      recentLists[index].select = true;
      update();
    } else {
      recentLists[index].select = false;
      update();
    }
  }

  selectChange(int index) {
    if (trendingLists[index].select == false) {
      trendingLists[index].select = true;
      update();
    } else {
      trendingLists[index].select = false;
      update();
    }
  }

  indexChange(RxInt value) {
    index.value = value.value;
    update();
  }

  addItem(int index) {
    selectedCategory.add(categoryList[index]);
    update();
  }

  removeItem(int index) {
    selectedCategory.remove(categoryList[index]);
    update();
  }

  onRatingChange(RxDouble value) {
    rating.value = value.value;
    update();
  }

  onChange(RangeValues value) {
    values = value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    searchController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    searchController.disclose;
  }
}

class SearchController extends GetxController {
  var searchController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    searchController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    searchController.disclose;
  }
}

class LessonController extends GetxController {
  List<ModelLesson> lessonLists = DataFile.lessonList;

  expandChange(RxInt index) {
    if (lessonLists[index.value].expand == true) {
      lessonLists[index.value].expand = false;
    } else {
      lessonLists[index.value].expand = true;
    }
    update();
  }
}

class ChoosePlanController extends GetxController {
  RxInt select = 0.obs;

  onChange(RxInt value) {
    select.value = value.value;
    update();
  }
}

class PaymentController extends GetxController {
  RxInt select = 0.obs;
  var cardNameController;
  var cardNumberController;
  var dateController;
  var cvvController;
  List<ModelCard> cardLists = DataFile.cardList;

  RxBool check = false.obs;

  onCheck() {
    check.value = check.value == true ? false : true;
    update();
  }

  onChange(RxInt value) {
    select.value = value.value;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    cardNameController = TextEditingController();
    cardNumberController = TextEditingController();
    dateController = TextEditingController();
    cvvController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    cardNameController.disclose;
    cardNumberController.disclose;
    dateController.disclose;
    cvvController.disclose;
  }
}

class ChatController extends GetxController {
  var searchController;
  var messageController;
  List<ModelChat> chatLists = DataFile.chatList;

  onItemChanged(String value) {
    chatLists = DataFile.chatList
        .where((string) => string.name!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    searchController = TextEditingController();
    messageController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    searchController.disclose;
    messageController.disclose;
  }
}

class EditProfileController extends GetxController {
  var nameController;
  var emailController;
  var phoneController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nameController.disclose;
    emailController.disclose;
    phoneController.disclose;
  }
}

class FeedBackController extends GetxController {
  var feedBackController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    feedBackController = TextEditingController();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    feedBackController.disclose;
  }
}

class FaqController extends GetxController {
  List<ModelFaq> faqLists = DataFile.faqLists;

  expandChange(RxInt index) {
    if (faqLists[index.value].expand == true) {
      faqLists[index.value].expand = false;
    } else {
      faqLists[index.value].expand = true;
    }
    update();
  }
}
