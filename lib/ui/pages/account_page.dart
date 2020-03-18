import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/services/auth_service.dart';
import 'package:learn_english/ui/modules/route_name.dart';

class AccountPage extends StatefulWidget {
  AccountPage({Key key}) : super(key: key);

  @override
  AccountPageState createState() => AccountPageState();
}

class AccountPageState extends State<AccountPage> {
  final AuthService authService = AuthService();
  String username;
  String avatar;
  bool loading =false;

  initState() {
    super.initState();
    authService.getCurrentUser().then((data) {
      setState(() {
        username = data.displayName;
      avatar = data.photoUrl;
      loading = true;
      });
      
    });
  }

  Future<Null> handleSignOut() async {
    await authService.signOut();
    Navigator.pushNamedAndRemoveUntil(
        context, RouteName.loginPage, (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return !loading? Center(child: CircularProgressIndicator())
     
      : SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  image:
                      DecorationImage(image: Image.network('${avatar}').image)),
              child: Text(username),
            ),
            FlatButton(
              onPressed: handleSignOut,
              color: Colors.red[400],
              child: Text('Sign Out'),
            ),
          ],
        ),
      );
    
  }
}
