import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learn_english/core/models/user.dart';

class UserService {
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
        'memory': 0,
        'state': null,
      },
    );
  }

  Future updateState(String userId, Map<String, dynamic> learningState) async {
    await Firestore.instance.collection('users').document(userId).updateData({
      'state': learningState,
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
      'memory': level,
    });
  }

  Future updateMatrix4by4HighScore(String userId, int score) async {
    await Firestore.instance.collection('users').document(userId).updateData({
      'matrix4by4': score,
    });
  }
}
