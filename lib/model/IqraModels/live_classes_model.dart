class LiveClassesModel {
  int? id;
  String? classTitle;
  String? instructorName;
  String? videoLink;
  DateTime? createdAt;
  DateTime? updatedAt;

  LiveClassesModel(
      {this.id,
      this.classTitle,
      this.instructorName,
      this.videoLink,
      this.createdAt,
      this.updatedAt});

  LiveClassesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classTitle = json['classTitle'];
    instructorName = json['instructorName'];
    videoLink = json['videoLink'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['classTitle'] = classTitle;
    data['instructorName'] = instructorName;
    data['videoLink'] = videoLink;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
