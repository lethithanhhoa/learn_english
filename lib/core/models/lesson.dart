import 'package:cloud_firestore/cloud_firestore.dart';

class Lesson {
  String lessonId;
  String lessonName;
  String image;
  int index;

  Lesson({this.lessonId, this.lessonName, this.image, this.index});

  factory Lesson.fromSnapshot(DocumentSnapshot snapshot) {
    return Lesson(
        lessonId: snapshot.data['lesson_id'],
        lessonName: snapshot.data['lesson_name'],
        image: snapshot.data['image_file'],
        index: snapshot.data['index']
        );
  }

  factory Lesson.fromJson(Map<String, dynamic> data) {
    return Lesson(
      lessonId: data['lesson_id'],
      lessonName: data['lesson_name'],
      image: data['image_file'],
      index: data['index'],
    );
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'lessonId': lessonId,
      'lessonName': lessonName,
      'imageFile': image,
    };
    return map;
  }

  factory Lesson.fromMap(Map<String, dynamic> data) {
    return Lesson(
      lessonId: data['lessonId'],
      lessonName: data['lessonName'],
      image: data['imageFile'],
      // index: data['index'],
    );
  }
}
