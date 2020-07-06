import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_english/core/models/user.dart';
import 'package:learn_english/core/services/auth_service.dart';
import 'package:learn_english/core/services/firestore_service.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../loading_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FireStoreService _fireStoreService = FireStoreService();
  AuthService _authService = new AuthService();

  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  Future handleSignInWithFacebook() async {
    if (kIsWeb) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text(
                  "Sorry! We don't support this method on the web. Please sign in with your Google account."),
            );
          });
      return;
    }
    FirebaseUser user = await _authService.signInWithFacebook();
    handle(user);
  }

  Future handleSignInWithGoogle() async {
    FirebaseUser user = await _authService.signInWithGoogle();
    handle(user);
    // if (user == null) {
    //   return showSimpleNotification(Text("Unable to sign in."),
    //       background: Colors.red, autoDismiss: true);
    // }
    // List<dynamic> documents =
    //     await _fireStoreService.findUsersByEmail(user.email);
    // if (documents.length == 0) {
    //   await _fireStoreService.saveUser(user);
    // }
    // print('Successfully signed in.');
    // Navigator.pushNamed(context, RouteName.home);
  }

  handle(FirebaseUser user) async {
    if (user == null) {
      return showSimpleNotification(Text("Unable to sign in."),
          background: Colors.red, autoDismiss: true);
    }
    bool isExisted = await _fireStoreService.findUsersByUID(user.uid);
    if (!isExisted) {
      await _fireStoreService.saveUser(user);
    }
    print('Successfully signed in.');
    Navigator.popAndPushNamed(context, RouteName.home);
  }

  @override
  Widget build(BuildContext context) {
    return (loading)
        ? LoadingPage()
        : Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: constraints.copyWith(
                      minHeight: constraints.maxHeight,
                      maxHeight: double.infinity,
                    ),
                    child: IntrinsicHeight(
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(vertical: 60),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Container(
                                  width: 210,
                                  height: 210,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [Colors.pink[50], Colors.pink],
                                      begin: Alignment.bottomLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                ),
                                Positioned(
                                    top: 5,
                                    left: 3,
                                    right: 8,
                                    bottom: 5,
                                    child: Container(
                                      width: 210,
                                      height: 210,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: Image.asset('assets/owl.jpg')
                                                .image,
                                            fit: BoxFit.fill),
                                      ),
                                    )),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Text(
                                  "EFK",
                                  style: TextStyle(
                                    fontSize: 45,
                                    color: Colors.pink,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Change The Future",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.pink[400],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: handleSignInWithFacebook,
                                  child: button('Sign In with Facebook'),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: handleSignInWithGoogle,
                                  child: button('Sign In with Google'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
  }

  Widget button(String nameButton) {
    return Container(
      width: 260,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(width: 1.2, color: Colors.pink[300]),
          borderRadius: BorderRadius.circular(50)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Row(
          children: <Widget>[
            (nameButton != 'Sign In with Facebook')
                ? Icon(
                    FontAwesomeIcons.google,
                    color: Colors.pink,
                  )
                : Icon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.blue[800],
                  ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                nameButton,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17.5,
                  color: Colors.pink[400],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
