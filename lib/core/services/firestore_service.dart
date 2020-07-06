import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learn_english/core/models/lesson.dart';
import 'package:learn_english/core/models/user.dart';
import 'package:learn_english/core/models/vocabulary.dart';

class FireStoreService {
  final _users = Firestore.instance.collection('users');
  final _vocabs = Firestore.instance.collection('vocabulary');
  final _lessons = Firestore.instance.collection('lessons');

  //--------------------------------------------------------//
  //user
  Future<List<User>> getAllUser() async {
    var ref = await _users.getDocuments();
    List<User> listOfUser =
        ref.documents.map((doc) => User.fromSnapshot(doc)).toList();
    return listOfUser;
  }

  Future<bool> findUsersByUID(String uid) async {
    var result = _users.document(_users.path + '/' + uid);
    return (result != null) ? true : false;
  }

  Future<List<DocumentSnapshot>> findUsersByEmail(String email) async {
    QuerySnapshot result = await _users
      .where('email', isEqualTo: email)
      .getDocuments();
    return result.documents;
  }

  Future saveUser(FirebaseUser userData) async {
    await _users.document(userData.uid).setData(
      {
        'name': userData.displayName,
        'email': userData.email,
        'avatar_url': userData.photoUrl,
        'exp': 0,
        'taptap': 0,
        'memory_card': 0,
        'learning_result': null,
      },
    );
  }

  Future updateLearningResult(
      String userId, Map<String, dynamic> learningResult) async {
    await _users.document(userId).updateData({
      'learning_result': learningResult,
    });
  }

  Future updateExp(String userId, int exp) async {
    await _users.document(userId).updateData({
      'exp': exp,
    });
  }

  Future updateTapTap(String userId, int score) async {
    await _users.document(userId).updateData({
      'taptap': score,
    });
  }

  Future updateMemoryCard(String userId, int level) async {
    await _users.document(userId).updateData({
      'memory_card': level,
    });
  }

  //-----------------------------------------------------------------//
  //vocab
  Future<List<Vocabulary>> getAllVocab() async {
    var ref = await _vocabs.getDocuments();
    List<Vocabulary> listOfVocab =
        ref.documents.map((doc) => Vocabulary.fromSnapshot(doc)).toList();
    listOfVocab.shuffle();
    return listOfVocab;
  }

  Future<List<Vocabulary>> getVocabByLesson(String lessonId) async {
    var ref =
        await _vocabs.where('lesson_id', whereIn: [lessonId]).getDocuments();
    List<Vocabulary> listOfVocab =
        ref.documents.map((doc) => Vocabulary.fromSnapshot(doc)).toList();
    return listOfVocab;
  }

  Future<List<Vocabulary>> getVocabByLessons(List<String> lessonIdList) async {
    List<Vocabulary> listOfVocab = new List();
      while (lessonIdList.length > 10) {
        var ref = await _vocabs
            .where('lesson_id', whereIn: lessonIdList.getRange(0, 9).toList())
            .getDocuments();
        lessonIdList.removeRange(0, 9);
        List<Vocabulary> temp =
            ref.documents.map((doc) => Vocabulary.fromSnapshot(doc)).toList();
        listOfVocab = listOfVocab + temp;
      }
      var ref = await _vocabs
          .where('lesson_id', whereIn: lessonIdList)
          .getDocuments();
      List<Vocabulary> temp =
          ref.documents.map((doc) => Vocabulary.fromSnapshot(doc)).toList();
      listOfVocab = listOfVocab + temp;
      
    return listOfVocab;
  }

  Future<List<Vocabulary>> getVocabByTypeOfWord() async {
    var ref = await _vocabs.where('type', whereIn: [1, 2]).getDocuments();
    List<Vocabulary> listOfVocab =
        ref.documents.map((doc) => Vocabulary.fromSnapshot(doc)).toList();
    listOfVocab.shuffle();
    return listOfVocab;
  }

  //--------------------------------------------------------------//
  //lesson
  Future<List<Lesson>> getAllLessons() async {
    var ref = await _lessons.getDocuments();
    List<Lesson> listOfLesson =
        ref.documents.map((doc) => Lesson.fromSnapshot(doc)).toList();
    listOfLesson.sort((a, b) => a.index.compareTo(b.index));
    return listOfLesson;
  }
}
