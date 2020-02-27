import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebooklogin = FacebookLogin();

  Future<FirebaseUser> googleSignIn() async {
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;
    } catch (error) {
      return error;
    }
  }

  Future facebookSignIn() async {
    try {
      final result = await _facebooklogin.logIn(['email']);

      if (result.status == FacebookLoginStatus.loggedIn) {
        final credential = FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token,
        );
        final user = (await _auth.signInWithCredential(credential)).user;
        return user;
      }
    } catch (error) {
      return error;
    }
  }

  Future signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    await _facebooklogin.logOut();
  }
}
