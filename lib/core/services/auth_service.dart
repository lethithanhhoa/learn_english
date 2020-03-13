import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:learn_english/core/models/user.dart';

// class AuthService {

// final FirebaseAuth _auth = FirebaseAuth.instance;
// final GoogleSignIn _googleSignIn = GoogleSignIn();

Future<String> googleSignIn() async {
  GoogleSignIn google = GoogleSignIn(
    scopes: <String>['email'],
  );
  try {
    final GoogleSignInAccount googleAccount = await google.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentUser =
        await FirebaseAuth.instance.currentUser();
    assert(user.uid == currentUser.uid);
    return user.uid;
  } catch (error) {
    print(error);
    return null;
  }
}

Future<void> googleSignOut() async {
  GoogleSignIn google = GoogleSignIn(
    scopes: <String>['email'],
  );
  await google.signOut();
}

Future<void> signOut() async {
  return FirebaseAuth.instance.signOut();
}

Future<FirebaseUser> getCurrentUser() async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  return user;
}

// Future<User> getCurrentUser() async {
//   FirebaseUser user = await FirebaseAuth.instance.currentUser();
//   if (user != null) {
//     return new User(
//         userId: user.uid,
//         googleId: user.providerId,
//         email: user.email,
//         name: user.displayName,
//         avatarUrl: user.photoUrl);
//   }
//   return null;
// }

// Future<bool> isUserSignedIn() async {
//   final FirebaseUser currentUser = await _auth.currentUser();
//   return currentUser != null;
// }

// void signOut() {
//   try {
//     _auth.signOut();
//   } catch (error) {
//     print(error);
//   }
// }

// // void onAuthenticationChange(Function isLogin) {
// //   _auth.onAuthStateChanged.listen((FirebaseUser user) {
// //     if (user != null) {
// //       isLogin(exposeUser(kUsername: user.displayName, kUID: user.uid));
// //     } else {
// //       isLogin(null);
// //     }
// //   });
// // }

// void onAuthenticationChange(Function isLogin) {
//   _auth.onAuthStateChanged.listen((FirebaseUser user) {
//     if (user != null) {
//       isLogin(User(
//         userId: user.uid,
//         googleId: user.providerId,
//         email: user.email,
//         name: user.displayName,
//         avatarUrl: user.photoUrl));
//     } else {
//       isLogin(null);
//     }
//   });
// }

// Future<User> signInWithGoogle() async {
//   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
//   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//   final AuthCredential credential = GoogleAuthProvider.getCredential(
//     accessToken: googleAuth.accessToken,
//     idToken: googleAuth.idToken,
//   );

//   final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;

//   if (user != null) {
//     return User(
//         userId: user.uid,
//         googleId: user.providerId,
//         email: user.email,
//         name: user.displayName,
//         avatarUrl: user.photoUrl);
//   }
//   return null;
// }

// Future <User> signInAnonymously() async {
//   final FirebaseUser user = (await _auth.signInAnonymously()).user;

//   if (user != null) {
//     return User(
//         userId: user.uid,
//         googleId: user.providerId,
//         email: user.email,
//         name: user.displayName,
//         avatarUrl: user.photoUrl);
//   }
//   return null;
// }

