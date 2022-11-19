import '../model/model_bottom.dart';
import '../model/model_card.dart';
import '../model/model_category.dart';
import '../model/model_chat.dart';
import '../model/model_contact_us.dart';
import '../model/model_country.dart';
import '../model/model_course.dart';
import '../model/model_detail_category.dart';
import '../model/model_faq.dart';
import '../model/model_home_slider.dart';
import '../model/model_intro.dart';
import '../model/model_lesson.dart';
import '../model/model_message.dart';
import '../model/model_ongoing.dart';
import '../model/model_recent.dart';
import '../model/model_review.dart';
import '../model/model_sub_course.dart';
import '../model/model_trending.dart';

class DataFile {
  static List<ModelIntro> introList = [
    ModelIntro(
      "intro1.png",
      "Learn new skills every day!",
      "We provide the best  learning couerses & great mentors for you.",
    ),
    ModelIntro(
      "intro2.png",
      "Easy enroll in class !",
      "Learn  anytime and anywhere easily  and  conveniently.",
    ),
    ModelIntro(
      "intro3.png",
      "Get online certificate ! ",
      "Complete the full course with full dedication to get  certificate.",
    ),
    ModelIntro(
      "intro4.png",
      "Explore new reasources !",
      "Find best course for your career that will help you to  develop your skill.",
    )
  ];

  static List<ModelCountry> countryList = [
    ModelCountry("image_fghanistan.png", "Afghanistan (AF)", "+93"),
    ModelCountry("image_ax.png", "Aland Islands (AX)", "+358"),
    ModelCountry("image_albania.png", "Albania (AL)", "+355"),
    ModelCountry("image_andora.png", "Austria (AT)", "+93"),
    ModelCountry("image_islands.png", "USA (U)", "+1"),
    ModelCountry("image_angulia.png", "Andorra(AD)", "+1"),
    ModelCountry("image_armenia.png", "Anguillia (AN)", "+1"),
    ModelCountry("image_austia.png", "India (IN)", "+91"),
    ModelCountry("image_thailand.png", "Thailand(TH)", "+66"),
  ];

  static List<ModelBottom> bottomList = [
    ModelBottom("home_bold.svg", "home.svg"),
    ModelBottom("course_bold.svg", "course.svg"),
    ModelBottom("chat_bold.svg", "chat.svg"),
    ModelBottom("profile_bold.svg", "profile.svg")
  ];

  static List<ModelHomeSlider> homeSliderList = [
    ModelHomeSlider('What you want to learn?', "slider1.png", "#C9ECFF"),
    ModelHomeSlider("Get online certificate.", "slider2.png", "#FFE9C9"),
    ModelHomeSlider("Want to get best advicer?", "slider3.png", "#FFC9C9")
  ];

  static List<ModelCategory> categoryList = [
    ModelCategory("category1.svg", "Design", "#FFF6E5"),
    ModelCategory("category2.svg", "Code", "#FEE9EB"),
    ModelCategory("category3.svg", "Business", "#ECF6FF"),
    ModelCategory("category4.svg", "Photography", "#DEFFF5")
  ];

  static List<ModelTrending> trendingList = [
    ModelTrending("trending1.png", "UI/UX Design master class", false, 4.9, "2 .40 Hrs",
        "Jenny Wilson", "trending_person1.png"),
    ModelTrending("trending2.png", "Office management master class", false, 4.9, "2 .40 Hrs",
        "Cody Fisher", "trnding_person2.png"),
    ModelTrending("trending3.png", "Digital photography master class", false, 3.5, "12 .30 Hrs",
        "Leslie Alexander", "trending_person3.png"),
    ModelTrending("trending4.png", "Software Development.", false, 3.5, "12 .30 Hrs",
        "Kristin Watson", "trending_person4.png"),
    ModelTrending("trending5.png", "Master in adobe photoshop", false, 4.9, "2 .40 Hrs",
        "Cody Fisher", "trending_person5.png"),
    ModelTrending("trending6.png", "Flutter Development.", false, 3.5, "12 .30 Hrs",
        "Kristin Watson", "trending_person4.png")
  ];

  static List<ModelRecent> recentList = [
    ModelRecent("recent1.png", "How to make creative photo with photoshop", 4.9, "2 .40 Hrs",
        "Jenny Wilson", 174.00, false, "recent_person1.png"),
    ModelRecent("recent2.png", "How to illustratior with diffirent menu and vector", 3.9,
        "12 .4 Hrs", "Jane Cooper", 140.00, false, "recent_person2.png"),
    ModelRecent("recent3.png", "Full course of coding with diffirent custom field", 3.9, "10.00Hrs",
        "Wade Warren", 150.00, false, "recent_person2.png")
  ];

  static List<ModelDetailCategory> detailCategoryList = [
    ModelDetailCategory("detail_cat1.svg", "12 Lessons"),
    ModelDetailCategory("detail_cat2.svg", "Beginner"),
    ModelDetailCategory("detail_cat3.svg", "6 Weeks"),
    ModelDetailCategory("detail_cat4.svg", "English"),
    ModelDetailCategory("detail_cat5.svg", "Certificate"),
    ModelDetailCategory("detail_cat6.svg", "Fully Secure")
  ];

  static List<ModelLesson> lessonList = [
    ModelLesson("lesson1.png", "Introduction", "Lesson 1", true),
    ModelLesson("lesson2.png", "User Research.", "Lesson 2", false),
    ModelLesson("lesson3.png", "Wireframing", "Lesson 3", false),
    ModelLesson("lesson4.png", "Types of UI design", "Lesson 4", false),
    ModelLesson("lesson1.png", "UI Layout", "Lesson 5", false)
  ];

  static List<ModelReview> reviewList = [
    ModelReview("review1.png", "“Thank You For Your Services That Save My Time Very Much”.   ",
        "1 day ago"),
    ModelReview(
        "review2.png", "“Thank You For Your Services That Save My Time Very Much”.", "2 day ago"),
    ModelReview(
        "review3.png", "“This app is very usefull for all the person in around”.", "2 day ago"),
    ModelReview(
        "review4.png", "“This app is very usefull for all the person in around”.", "3 day ago")
  ];

  static List<ModelCard> cardList = [
    ModelCard("paypal.png", "Paypal", false),
    ModelCard("mastercard.png", "Master Card", false),
    ModelCard("visa.png", "Visa", false),
    ModelCard("money 1.png", "Cash", false)
  ];

  static List<ModelOngoing> ongoingList = [
    ModelOngoing("ongoing1.png", "UI UX Design", "8 Lesson to go", 0.78, "78%"),
    ModelOngoing("ongoing2.png", "Flutter Mobile Apps", "2 Lesson to go", 0.90, "90%"),
    ModelOngoing("ongoing3.png", "Python Programming ", "4 Lesson to go", 0.94, "94%"),
    ModelOngoing("ongoing4.png", "Graphic Designing", "5 Lesson to go", 0.96, "96%")
  ];

  static List<ModelOngoing> completedList = [
    ModelOngoing("completed1.png", "Web Designing", "8 Lesson", 1.0, "100%"),
    ModelOngoing("completed2.png", "Javascript", "12 Lesson", 1.0, "100%")
  ];

  static List<ModelCourse> courseList = [
    ModelCourse("Lesson 1 - Introducation", "30 Min", [
      ModelSubCourse("01", "Lorem ipsum dolor sit amet consectetur", "12 min", "video-circle.svg"),
      ModelSubCourse("02", "Lorem ipsum dolor sit amet consectetur", "10 min", "video-circle.svg"),
      ModelSubCourse("03", "Lorem ipsum dolor sit amet consectetur", "8 min", "video-circle.svg"),
    ]),
    ModelCourse("Lesson 2 - User Research", "60 Min", [
      ModelSubCourse("04", "Lorem ipsum dolor sit amet consectetur", "16 min", "video-circle.svg"),
      ModelSubCourse("05", "Lorem ipsum dolor sit amet consectetur", "8 min", "lock.svg"),
      ModelSubCourse("06", "Lorem ipsum dolor sit amet consectetur", "14 min", "lock.svg"),
    ]),
  ];

  static List<ModelChat> chatList = [
    ModelChat("chat1.png", "Jane Cooper", "perfect!", "11:15", "2"),
    ModelChat("chat2.png", "Leslie Alexander", "How are you?", "11:15", "3"),
    ModelChat("chat3.png", "Jacob Jones", "How can i help you?", "10:20", "0"),
    ModelChat("chat4.png", "Jacob Jones", "How can i help you?", "10:20", "0"),
    ModelChat("chat5.png", "Leslie Alexander", "How are you?", "11:15", "0")
  ];

  static List<ModelMessage> messageList = [
    ModelMessage(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, ", "2:55 PM", "receiver"),
    ModelMessage(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ",
        "3:02 PM",
        "sender"),
    ModelMessage("Lorem ipsum dolor sit amet, consectetur adipiscing elit, ", "3:10 PM", "receiver")
  ];

  static List<ModelFaq> faqLists = [
    ModelFaq("What is Learn Management ?", true),
    ModelFaq("How to use Learn Management ?", false),
    ModelFaq("Is Learn Management free to use?", false),
    ModelFaq("Can i create my own course?", false),
    ModelFaq("Lorem ipsum dolor sit amet", false),
    ModelFaq("Lorem ipsum dolor sit amet", false)
  ];

  static List<ModelContactUs> contactUsList = [
    ModelContactUs("headphone.svg", "Customer Service"),
    ModelContactUs("website.svg", "Website"),
    ModelContactUs("whatsapp.svg", "Whatsapp"),
    ModelContactUs("facebook_icon.svg", "Facebook"),
    ModelContactUs("instagram.svg", "Instagram")
  ];
}
