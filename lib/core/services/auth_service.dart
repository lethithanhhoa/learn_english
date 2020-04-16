import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learn_english/core/models/user.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    return user;
  }

  Future<Null> signOut() async {
    await FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
    return;
  }

  Future<bool> isSignedIn() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return (user != null);
  }

  Future<String> getUidCurrentUser() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return user.uid;
  }
  
  Future<User> getDetailCurrentUser() async {
    String docId =  await getUidCurrentUser();
    var currentUser =
        await Firestore.instance.collection('users').document(docId).get();
    return User.fromSnapshot(currentUser);
  }
  
}
