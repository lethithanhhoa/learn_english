import 'package:cloud_firestore/cloud_firestore.dart';

class Lesson {
  String lessonId;
  String name;
  String image;

  Lesson({this.lessonId, this.name, this.image});

  factory Lesson.fromSnapshot(DocumentSnapshot snapshot) {
    return Lesson(
        lessonId: snapshot.documentID,
        name: snapshot.data['lessonName'],
        image: snapshot.data['image']);
  }

  factory Lesson.fromJson(Map<String, dynamic> data) {
    return Lesson(
      lessonId: data['id'],
      name: data['lessonName'],
      image: data['image'],
    );
  }
}
