import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_english/core/services/auth_service.dart';
import 'package:learn_english/core/services/user_service.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:learn_english/ui/pages/loading_page.dart';
import 'package:overlay_support/overlay_support.dart';

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
      // SharedPreferences preferences = await SharedPreferences.getInstance();
      // FirebaseUser user = await _authService.getCurrentUser();
      // await preferences.setString('name', user.displayName);
      // await preferences.setString('email', user.email);
      // await preferences.setString('avatar_url', user.photoUrl);
      // print('Already signed in.');

      Navigator.pushNamed(context, RouteName.home);
    }

    this.setState(() {
      loading = false;
    });
  }

  Future handleSignInWithFacebook() async {
    this.setState(() {
      loading = true;
    });
    // SharedPreferences preferences = await SharedPreferences.getInstance();

    FirebaseUser user = await _authService.facebookSignIn();
    if (user == null) {
      this.setState(() {
        loading = false;
      });
      return showSimpleNotification(Text("Unable to sign in."),
          background: Colors.red, autoDismiss: true);
    }

    List<dynamic> documents = await _userService.findUsersByEmail(user.email);
    if (documents.length == 0) {
      await _userService.saveUser(user);
    }

    // await preferences.setString('name', user.displayName);
    // await preferences.setString('email', user.email);
    // await preferences.setString('avatar_url', user.photoUrl);

    print('Successfully signed in.');
    Navigator.pushNamed(context, RouteName.home);

    this.setState(() {
      loading = false;
    });
  }

  Future handleSignIn() async {
    this.setState(() {
      loading = true;
    });
    // SharedPreferences preferences = await SharedPreferences.getInstance();

    FirebaseUser user = await _authService.signInWithGoogle();
    if (user == null) {
      this.setState(() {
        loading = false;
      });
      return showSimpleNotification(Text("Unable to sign in."),
          background: Colors.red, autoDismiss: true);
    }

    List<dynamic> documents = await _userService.findUsersByEmail(user.email);
    if (documents.length == 0) {
      await _userService.saveUser(user);
    }

    // await preferences.setString('name', user.displayName);
    // await preferences.setString('email', user.email);
    // await preferences.setString('avatar_url', user.photoUrl);

    print('Successfully signed in.');
    Navigator.pushNamed(context, RouteName.home);

    this.setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loading
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
                                  child: Container(
                                    width: 240,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.2,
                                            color: Colors.pink[300]),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.facebookF,
                                          color: Colors.blue[900],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Sign In with Facebook",
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
                                GestureDetector(
                                  onTap: handleSignIn,
                                  child: Container(
                                    width: 240,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1.2,
                                            color: Colors.pink[300]),
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          FontAwesomeIcons.google,
                                          color: Colors.pink,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Sign In with Google",
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
}

// class _LoginPageState extends State<LoginPage> {
//   BookService bookService = new BookService();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: EdgeInsets.fromLTRB(15, 60, 15, 60),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,

//             children: <Widget>[
//               Stack(
//                 children: <Widget>[
//                   Container(

//                     width: 230,
//                     height: 230,
//                     decoration: BoxDecoration(
//                       // borderRadius: BorderRadius.circular(
//                       //     MediaQuery.of(context).size.width),
//                       shape: BoxShape.circle,
//                       gradient: LinearGradient(
//                         colors: [Colors.pink[50], Colors.pink],
//                         begin: Alignment.bottomLeft,
//                         end: Alignment.bottomRight,
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 7,
//                     left: 3,
//                     right: 9,
//                     bottom: 7,
//                     child: CircleAvatar(
//                       backgroundImage: Image.asset('assets/owl.jpg').image,
//                     ),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: <Widget>[
//                   Text(
//                     "Lingo",
//                     style: TextStyle(
//                       fontSize: 45,
//                       color: Colors.pink,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     "Change The Future",
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.pink[400],
//                     ),
//                   ),
//                 ],
//               ),
//               Center(
//                 child: Column(
//                   children: <Widget>[
//                     Container(
//                       width: 230,
//                       decoration: BoxDecoration(
//                           border: Border.all(width: 1.2, color: Colors.pink),
//                           borderRadius: BorderRadius.circular(50)),
//                       child: FlatButton(
//                         onPressed: () {
//                           // bookService.getData();
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Icon(
//                               FontAwesomeIcons.facebookF,
//                               color: Colors.blue[900],
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               "Login with Facbook",
//                               style: TextStyle(
//                                 fontSize: 17.5,
//                                 color: Colors.pink[400],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       width: 230,
//                       decoration: BoxDecoration(
//                           border: Border.all(width: 1.2, color: Colors.pink),
//                           borderRadius: BorderRadius.circular(50)),
//                       child: FlatButton(
//                         onPressed: () {},
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Icon(
//                               FontAwesomeIcons.google,
//                               color: Colors.pink,
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                             Text(
//                               "Login with Google",
//                               style: TextStyle(
//                                 fontSize: 17.5,
//                                 color: Colors.pink[400],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
