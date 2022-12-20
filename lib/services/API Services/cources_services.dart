import 'dart:developer';

import '../APIs.dart';
import '../api_services.dart';

class CoursesServices {
  APIService? apiService;
  CoursesServices() {
    apiService = APIService();
  }

  getLiveCourses(context) async {
    final response = await apiService!
        .getData(context: context, url: Apis.getLiveClasses, isAuthenticated: true);
    log("response data : $response ", name: "getLiveCourses");
    return response;
  }

  getAddCourse(context) async {
    final response =
        await apiService!.getData(context: context, url: Apis.getAddCourse, isAuthenticated: true);
    log("response data : $response ", name: "getLiveCourses");
    return response;
  }

  getUploadContent(context) async {
    final response = await apiService!
        .getData(context: context, url: Apis.getUploadContent, isAuthenticated: true);
    log("response data : $response ", name: "getLiveCourses");

    return response;
  }
}
