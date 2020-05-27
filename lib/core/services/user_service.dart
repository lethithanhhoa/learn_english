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
        'matrix2by2': 0,
        'matrix3by3': 0,
        'matrix4by4': 0,
        'state': null,
      },
    );
  }

  Future updateState(
      String userId, Map<String, dynamic> learningState) async {
    await Firestore.instance.collection('users').document(userId).updateData({
      'state': learningState,
    });
  
  }

  Future updateExp(
      String userId, int exp) async {
    await Firestore.instance.collection('users').document(userId).updateData({
      'exp': exp,
    });
  
  }

  Future updateMatrix2by2HighScore(
      String userId, int score) async {
    await Firestore.instance.collection('users').document(userId).updateData({
      'matrix2by2': score,
    });
    
  }

  Future updateMatrix3by3HighScore(
      String userId, int score) async {
    await Firestore.instance.collection('users').document(userId).updateData({
      'matrix3by3': score,
    });
   
  }

  Future updateMatrix4by4HighScore(
      String userId, int score) async {
    await Firestore.instance.collection('users').document(userId).updateData({
      'matrix4by4': score,
    });
  }

}
