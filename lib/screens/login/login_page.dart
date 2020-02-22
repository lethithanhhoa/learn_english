import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _message = 'You are not sign in';

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin _facebooklogin = FacebookLogin();

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    setState(() {
      _message = "You are signed in";
    });
    return user;
  }

  Future _checkLogin() async {
    final FirebaseUser user = await _auth.currentUser();
    if (user != null) {
      setState(() {
        _message = "You are signed in";
      });
    }
  }

  Future _loginWithFacebook() async {
    final result = await _facebooklogin.logIn(['email']);

    if (result.status == FacebookLoginStatus.loggedIn) {
      final credential = FacebookAuthProvider.getCredential(
        accessToken: result.accessToken.token,
      );
      final user = (await _auth.signInWithCredential(credential)).user;
      setState(() {
        _message = "Logged in as ${user.displayName}";
      });
    }
  }

  @override
  void initState() {
    _checkLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 50, 15, 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width - 150,
                    height: MediaQuery.of(context).size.width - 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width),
                      gradient: LinearGradient(
                        colors: [Colors.pink[50], Colors.pink],
                        begin: Alignment.bottomLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 7,
                    left: 3,
                    right: 9,
                    bottom: 7,
                    child: CircleAvatar(
                      backgroundImage: Image.asset('assets/owl.jpg').image,
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    "Lingo",
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
              Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 7 * 4.5,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.2, color: Colors.pink),
                          borderRadius: BorderRadius.circular(50)),
                      child: FlatButton(
                        onPressed: () {
                          _loginWithFacebook();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.facebookF,
                              color: Colors.blue[900],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Login with Facbook",
                              style: TextStyle(
                                fontSize: 17.5,
                                color: Colors.pink[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 7 * 4.5,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.2, color: Colors.pink),
                          borderRadius: BorderRadius.circular(50)),
                      child: FlatButton(
                        onPressed: () {
                          _handleSignIn();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.google,
                              color: Colors.pink,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Login with Google",
                              style: TextStyle(
                                fontSize: 17.5,
                                color: Colors.pink[400],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
