class UploadedContentModel {
  int? id;
  String? course;
  String? subject;
  List<Video>? video;
  String? author;
  String? createdAt;
  String? updatedAt;

  UploadedContentModel(
      {this.id,
      this.course,
      this.subject,
      this.video,
      this.author,
      this.createdAt,
      this.updatedAt});

  UploadedContentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    course = json['course'];
    subject = json['subject'];
    if (json['video'] != null) {
      video = <Video>[];
      json['video'].forEach((v) {
        video!.add(new Video.fromJson(v));
      });
    }
    author = json['author'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['course'] = course;
    data['subject'] = subject;
    if (video != null) {
      data['video'] = video!.map((v) => v.toJson()).toList();
    }
    data['author'] = author;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Video {
  String? link;
  String? title;

  Video({this.link, this.title});

  Video.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    data['title'] = title;
    return data;
  }
}
