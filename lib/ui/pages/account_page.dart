import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/user.dart';
import 'package:learn_english/core/services/auth_service.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/pages/loading_page.dart';
import 'package:provider/provider.dart';

class AccountProvider extends ChangeNotifier {
  AuthService authService = AuthService();
  User user;
  AccountProvider() {
    authService.getDetailCurrentUser().then((data) {
      user = data;
      notifyListeners();
    });
  }
  
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountProvider()),
      ],
      child: AccountChildPage(),
    );
  }
}

class AccountChildPage extends StatelessWidget {
  
  AuthService authService = AuthService();
  Future<Null> handleSignOut() async {
    await authService.signOut();
  }
  @override
  Widget build(BuildContext context) {
    AccountProvider accountProvider = Provider.of<AccountProvider>(context);
    if (accountProvider.user == null)
      return LoadingPage();
    return Scaffold(
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: Image.network(accountProvider.user.avatarUrl)
                              .image, fit: BoxFit.fill)),
                ),
                Text('Name: ${accountProvider.user.name}'),
                Text('Email: ${accountProvider.user.email}'),
                Text('Score: ${accountProvider.user.score}'),
                FlatButton(
                  onPressed: () {
                    handleSignOut();
                    Navigator.pushNamedAndRemoveUntil(context, RouteName.loginPage,
                        (Route<dynamic> route) => false);
                  },
                  child: Text('Logout'),
                  color: Colors.pink,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
