// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:learn_english/core/models/lesson.dart';
// import 'package:learn_english/core/models/user.dart';
// import 'package:learn_english/core/models/vocabulary.dart';

// class DatabaseService {
//   // final CollectionReference _lessons = Firestore.instance.collection('lessons');

//   final CollectionReference _users = Firestore.instance.collection('users');

//   // final CollectionReference _vocabs =
//   //     Firestore.instance.collection('vocabulary');

//   // Future<List<User>> getAllUser() async {
//   //   var ref = await _users.getDocuments();
//   //   List<User> listOfUser =
//   //       ref.documents.map((doc) => User.fromSnapshot(doc)).toList();
//   //   return listOfUser;
//   // }

//   // Future<List<Lesson>> getListOfLesson() async {
//   //   var ref = await _lessons.getDocuments();
//   //   List<Lesson> listOfLesson =
//   //       ref.documents.map((doc) => Lesson.fromSnapshot(doc)).toList();
//   //   // listOfLesson.sort((Lesson a, Lesson b) => a.index.compareTo(b.index));
//   //   return listOfLesson;
//   // }

//   // Future<List<Vocabulary>> getListOfVocab(String lessonId) async {
//   //   var ref =
//   //       await _lessons.document(lessonId).collection('vocab').getDocuments();
//   //   List<Vocabulary> listOfVocab =
//   //       ref.documents.map((doc) => Vocabulary.fromSnapshot(doc)).toList();

//   //   listOfVocab.shuffle();

//   //   return listOfVocab;
//   // }

//   // Future<List<Vocabulary>> getAllVocab() async {
//   //   var ref = await _vocabs.getDocuments();
//   //   List<Vocabulary> listOfVocab =
//   //       ref.documents.map((doc) => Vocabulary.fromSnapshot(doc)).toList();
//   //   listOfVocab.shuffle();
//   //   return listOfVocab;
//   // }

//   // Future<List<Vocabulary>> getVocabByLesson(List<String> lessonId) async {
//   //   var ref = await _vocabs.where('lessonId', whereIn: lessonId).getDocuments();
//   //   List<Vocabulary> listOfVocab =
//   //       ref.documents.map((doc) => Vocabulary.fromSnapshot(doc)).toList();
//   //   // listOfVocab.shuffle();
//   //   return listOfVocab;
//   // }

//   // Future<List<Vocabulary>> getVocabByTypeOfWord() async {
//   //   var ref = await _vocabs.where('type', whereIn: [1, 2]).getDocuments();
//   //   List<Vocabulary> listOfVocab =
//   //       ref.documents.map((doc) => Vocabulary.fromSnapshot(doc)).toList();
//   //   listOfVocab.shuffle();
//   //   return listOfVocab;
//   // }
// }
