import 'package:cloud_firestore/cloud_firestore.dart';

class Lesson {
  String lessonId;
  String lessonName;
  String image;
  // int index;

  Lesson({this.lessonId, this.lessonName, this.image});

  factory Lesson.fromSnapshot(DocumentSnapshot snapshot) {
    return Lesson(
        lessonId: snapshot.documentID,
        lessonName: snapshot.data['lessonName'],
        image: snapshot.data['imgName']
        // index: snapshot.data['index']
        );
  }

  factory Lesson.fromJson(Map<String, dynamic> data) {
    return Lesson(
      lessonId: data['id'],
      lessonName: data['lessonName'],
      image: data['imgName'],
      // index: data['index'],
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
