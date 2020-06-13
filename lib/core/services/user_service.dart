import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learn_english/core/models/user.dart';

class UserService {
  Future<List<User>> getAllUser() async {
    var ref = await Firestore.instance.collection('users').getDocuments();
    List<User> listOfUser =
        ref.documents.map((doc) => User.fromSnapshot(doc)).toList();
    return listOfUser;
  }

  Future<List<DocumentSnapshot>> findUsersByEmail(String email) async {
    var result = await Firestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .getDocuments();

    return result.documents;
  }

  Future saveUser(FirebaseUser userData) async {
    await Firestore.instance.collection('users').document(userData.uid).setData(
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

  Future updateLearningResult(String userId, Map<String, dynamic> learningResult) async {
    await Firestore.instance.collection('users').document(userId).updateData({
      'learning_result': learningResult,
    });
  }

  Future updateExp(String userId, int exp) async {
    await Firestore.instance.collection('users').document(userId).updateData({
      'exp': exp,
    });
  }

  Future updateTapTap(String userId, int score) async {
    await Firestore.instance.collection('users').document(userId).updateData({
      'taptap': score,
    });
  }

  Future updateMemoryCard(String userId, int level) async {
    await Firestore.instance.collection('users').document(userId).updateData({
      'memory_card': level,
    });
  }
}
