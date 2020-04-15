import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService {
  Future<List<DocumentSnapshot>> findUsersByEmail(String email) async {
    var result = await Firestore.instance
        .collection('users')
        .where('email', isEqualTo: email).getDocuments();
    
    return result.documents;
  }

  Future<Null> saveUser(FirebaseUser userData) async {
     await Firestore.instance
        .collection('users')
        .document(userData.uid)
        .setData({
      'name': userData.displayName,
      'email': userData.email,
      'avatar_url': userData.photoUrl,
      'score': 0,
      'state': null,
    },);

    return;
  }
}
