import 'dart:developer';

import '../api.dart';
import '../api_services.dart';

class CoursesServices {
  APIService? apiService;
  CoursesServices() {
    apiService = APIService();
  }

  getLiveCourses(context) async {
    final response = await apiService!
        .getData(context: context, url: Apis.getLiveClasses, isAuthenticated: true);
    log("response URL : ${Apis.getLiveClasses}", name: "GET LiveCourses");
    log("response data : $response ", name: "GET LiveCourses");
    return response;
  }

  getAddCourse(context) async {
    final response =
        await apiService!.getData(context: context, url: Apis.getAddCourses, isAuthenticated: true);
    log("response URL : ${Apis.getAddCourses}", name: "GET addCourses");
    log("response data : $response ", name: "GET addCourses");
    return response;
  }

  getUploadContent(context) async {
    final response =
        await apiService!.getData(context: context, url: Apis.getContents, isAuthenticated: true);
    log("response URL : ${Apis.getContents}", name: "GET UploadContent");
    log("response data : $response ", name: "GET UploadContent");

    return response;
  }

  getCategory(context) async {
    final response =
        await apiService!.getData(context: context, url: Apis.getCategory, isAuthenticated: true);
    log("response URL : ${Apis.getContents}", name: "GET UploadContent");
    log("response data : $response ", name: "GET UploadContent");
    return response;
  }

  getBanners(context) async {
    final response =
        await apiService!.getData(context: context, url: Apis.getBanners, isAuthenticated: true);
    log("response URL : ${Apis.getContents}", name: "GET UploadContent");
    log("response data : $response ", name: "GET UploadContent");
    return response;
  }
}
