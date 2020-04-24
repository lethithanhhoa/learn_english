import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/models/user.dart';
import 'package:learn_english/core/services/auth_service.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/pages/loading_page.dart';

import 'package:learn_english/ui/state/account_user.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AccountUser()),
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
    AccountUser accountUser = Provider.of<AccountUser>(context);

    if (accountUser.user == null) return LoadingPage();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 170,
                    color: Colors.green[200],
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Colors.green[200],
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Container(
                          height: 170,
                          width: 170,
                          decoration: BoxDecoration(
                            // color: Colors.yellow[100],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: Image.network(accountUser.user.avatarUrl)
                                    .image,
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      accountUser.user.name,
                      style: TextStyle(fontSize: 40, color: Colors.black87),
                    ),
                    Text(
                      'Email: ${accountUser.user.email}',
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          // alignment: Alignment.center,
                          // color: Colors.pink,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                    style: GoogleFonts.handlee(
                                        textStyle: TextStyle(
                                            color: Colors.green[300],
                                            fontSize: 18)),
                                    children: <TextSpan>[
                                      TextSpan(text: 'EXP: '),
                                      TextSpan(
                                          text: '${accountUser.user.exp}',
                                          style: TextStyle(
                                              color: Colors.orange[300],
                                              fontSize: 25)),
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    style: GoogleFonts.handlee(
                                        textStyle: TextStyle(
                                            color: Colors.green[300],
                                            fontSize: 18)),
                                    children: <TextSpan>[
                                      TextSpan(text: 'Matrix 2x2 High Score: '),
                                      TextSpan(
                                          text: '${accountUser.user.matrix2by2}',
                                          style: TextStyle(
                                              color: Colors.orange[300],
                                              fontSize: 25)),
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    style: GoogleFonts.handlee(
                                        textStyle: TextStyle(
                                            color: Colors.green[300],
                                            fontSize: 18)),
                                    children: <TextSpan>[
                                      TextSpan(text: 'Matrix 3x3 High Score: '),
                                      TextSpan(
                                          text: '${accountUser.user.matrix3by3}',
                                          style: TextStyle(
                                              color: Colors.orange[300],
                                              fontSize: 25)),
                                    ]),
                              ),
                              RichText(
                                text: TextSpan(
                                    style: GoogleFonts.handlee(
                                        textStyle: TextStyle(
                                            color: Colors.green[300],
                                            fontSize: 18)),
                                    children: <TextSpan>[
                                      TextSpan(text: 'Maxtrix 4x4 High Score: '),
                                      TextSpan(
                                          text: '${accountUser.user.matrix4by4}',
                                          style: TextStyle(
                                              color: Colors.orange[300],
                                              fontSize: 25)),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        handleSignOut();
                        Navigator.pushNamedAndRemoveUntil(
                            context,
                            RouteName.loginPage,
                            (Route<dynamic> route) => false);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Container(
                          height: 40,
                          width: 100,
                          color: Colors.orange[300],
                          child: Center(
                            child: Text(
                              'Sign Out',
                              style: TextStyle(
                                  // backgroundColor: Colors.green,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[

        //     Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         Container(
        //           height: 100,
        //           width: 100,
        //           decoration: BoxDecoration(
        //             color: Colors.blue,
        //               shape: BoxShape.circle,
        //               image: DecorationImage(
        //                   image: Image.network(accountUser.user.avatarUrl)
        //                       .image, fit: BoxFit.fill)),
        //         ),
        //         Text('Name: ${accountUser.user.name}'),
        //         Text('Email: ${accountUser.user.email}'),
        //         Text('EXP: ${accountUser.user.exp}'),
        //         FlatButton(
        //           onPressed: () {
        //             handleSignOut();
        //             Navigator.pushNamedAndRemoveUntil(context, RouteName.loginPage,
        //                 (Route<dynamic> route) => false);
        //           },
        //           child: Text('Logout'),
        //           color: Colors.pink,
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
