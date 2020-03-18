import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learn_english/core/services/auth_service.dart';
import 'package:learn_english/core/services/user_service.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  void initState(){
    super.initState();
    checkUserSignedIn();
  }

  void checkUserSignedIn() async {
    bool isSignedIn = await _authService.isSignedIn();
    if (isSignedIn){
      _authService.signOut();
    }
  }

  Future<Null> handleSignIn() async {
    this.setState((){
      loading = true;
    });
    SharedPreferences preferences = await SharedPreferences.getInstance();
    
    FirebaseUser user = await _authService.signInWithGoogle();
    if (user == null){
      this.setState((){
        loading = false;
      });
      return showSimpleNotification(
        Text("Unable to sign in."),
        background: Colors.red,
        autoDismiss: true
      );
    }
  
    List<dynamic> documents = await _userService.findUsersById(user.email);
    if (documents.length == 0){
      await _userService.save(user);
    }

    await preferences.setString('name', user.displayName);
    await preferences.setString('email', user.email);
    await preferences.setString('avatar_url', user.photoUrl);
    

    print('Successfully signed in.');
    Navigator.pushNamed(context, RouteName.homePage);

    this.setState((){
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      loading? Center(child: CircularProgressIndicator())
      : Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children : <Widget>[
                    Padding(
                      padding: EdgeInsets.all(5),
                      child: Text('Để lưu kết quả học tập, bạn cần đăng nhập.', style: TextStyle(color : Colors.black54, fontSize: 12), ),
                    ),
                    FlatButton(
                      onPressed: handleSignIn,
                      color: Colors.red[400],
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.account_circle, color: Colors.white),
                          Text(' ĐĂNG NHẬP VỚI GOOGLE', style: TextStyle(color: Colors.white)) 
                        ],  
                      ),
                    ),
                  ]
                ),
              ),
              Divider(thickness: 1)
            ],
          ),
          
        ],
      )
      
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
