import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_english/ui/modules/route_name.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(onPressed: () {
                          Navigator.pushNamed(context, RouteName.homePage);
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
                        ),),
      ),
    );
  }
  
}


// import 'package:learn_english/core/provider/auth_provider.dart';
// import 'package:learn_english/ui/modules/route_name.dart';
// import 'package:provider/provider.dart';

// class LoginPage extends StatelessWidget {

//   void signIn(context, String service) {
//     //Navigator.pushReplacementNamed(context, '/home');
//     Provider.of<AuthState>(context, listen: true)
//         .login(serviceName: service);
    
//   }

//   void gotoHomeScreen(BuildContext context) {
//   Future.microtask(() {
//     if (Provider.of<AuthState>(context, listen: false).authStatus ==
//         kauthSuccess) {
//       Navigator.pushNamed(context, RouteName.homePage);
//     }
//   });
// }

//   @override
//   Widget build(BuildContext context) {
//     // gotoHomeScreen(context);
    
//     return ChangeNotifierProvider<AuthState>.value(
//       value: AuthState(),
//     child: Consumer<AuthState>(
//       builder: (builder, authState, child) {
//         return Scaffold(
//           body: Container(
//             width: 400,
//             margin: EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 Container(
//                   margin: EdgeInsets.only(top: 100),
//                   child: Text(
//                     'Ten Thoi Ma',
//                     style: TextStyle(
//                       fontSize: 40.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blueAccent,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 200.0,
//                 ),
//                 if (authState.authStatus == kauthLoading)
//                   Text(
//                     'loading...',
//                     style: TextStyle(fontSize: 12.0),
//                   ),
//                 if (authState.authStatus == null ||
//                     authState.authStatus == kauthError)
//                   Container(
//                     child: Column(
//                       children: <Widget>[
//                         FlatButton(
//                           child: Text('Google Sign In'),
//                           onPressed: () => signIn(context, kauthSignInGoogle),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         FlatButton(
//                           child: Text('Anonymous Sign In'),
//                           onPressed: () => signIn(context, kauthSignInAnonymous),
//                         ),
//                       ],
//                     ),
//                   ),
//                 if (authState.authStatus == kauthError)
//                   Text(
//                     'Error...',
//                     style: TextStyle(fontSize: 12.0, color: Colors.redAccent),
//                   ),
//               ],
//             ),
//           ),
//         );
//       },
//     ),);
//   }
// }
