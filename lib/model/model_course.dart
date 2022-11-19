import 'model_sub_course.dart';

class ModelCourse {
  String? lessonName;
  String? time;
  List<ModelSubCourse>? subCourseList;

  ModelCourse(this.lessonName, this.time, this.subCourseList);
}
