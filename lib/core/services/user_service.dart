import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserService{
  Future<List<DocumentSnapshot>> findUsersById(String email) async {
    QuerySnapshot result = await Firestore.instance
      .collection('users')
      .where('email', isEqualTo: email)
      .getDocuments();
    print('Query Result : ${result.documents}');
    return result.documents;
  }

  Future<Null> save(FirebaseUser userData) async { 
    DocumentReference savedUser = await Firestore.instance
      .collection('users')
      .add({
        'name' : userData.displayName,
        'email' : userData.email,
        'avatar_url' : userData.photoUrl,
      });
    print(savedUser);
    return;
  }
  
}