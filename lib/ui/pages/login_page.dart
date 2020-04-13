import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/services/auth_service.dart';
import 'package:learn_english/core/services/user_service.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final UserService _userService = new UserService();
  final AuthService _authService = new AuthService();

  bool loading = false;

  @override
  void initState() {
    super.initState();
    checkUserSignedIn();
  }

  void checkUserSignedIn() async {
    this.setState(() {
      loading = true;
    });
    bool isSignedIn = await _authService.isSignedIn();
    if (isSignedIn) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      FirebaseUser user = await _authService.getCurrentUser();
      await preferences.setString('name', user.displayName);
      await preferences.setString('email', user.email);
      await preferences.setString('avatar_url', user.photoUrl);
      print('Already signed in.');
      Navigator.pushNamed(context, RouteName.homePage);
    }
    this.setState(() {
      loading = false;
    });
  }

  Future<Null> handleSignIn() async {
    this.setState(() {
      loading = true;
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();

    FirebaseUser user = await _authService.signInWithGoogle();
    if (user == null) {
      this.setState(() {
        loading = false;
      });
      return showSimpleNotification(Text("Unable to sign in."),
          background: Colors.red, autoDismiss: true);
    }

    List<dynamic> documents = await _userService.findUsersById(user.email);
    if (documents.length == 0) {
      await _userService.save(user);
    }

    await preferences.setString('name', user.displayName);
    await preferences.setString('email', user.email);
    await preferences.setString('avatar_url', user.photoUrl);

    print('Successfully signed in.');
    Navigator.pushNamed(context, RouteName.homePage);

    this.setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loading
            ? Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            width: 220,
                            height: 220,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  colors: [Colors.pink[50], Colors.pink[400]]),
                            ),
                          ),
                          Positioned(
                            left: 3,
                            top: 5,
                            bottom: 5,
                            right: 7,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: Image.asset('assets/owl.jpg').image,
                                    fit: BoxFit.fill),
                              ),
                              // child: Image.asset('assets/owl.jpg')
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'efk',
                        //monoton
                        style: GoogleFonts.rockSalt(
                          color: Colors.pink[400],
                          fontSize: 80,
                          // backgroundColor: Colors.pink,
                        ),
                      ),
                    ],
                  ),
                  FlatButton(
                      onPressed: handleSignIn,
                      color: Colors.pink,
                      child: Text('Sign in with Google',
                      style: TextStyle(
                        fontSize: 20,
                        
                      ),
                      ),
                        
                      ),
                ],
              ));
  }
}
