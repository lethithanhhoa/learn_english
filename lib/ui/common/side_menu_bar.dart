import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/services/auth_service.dart';
import 'package:learn_english/ui/modules/route_name.dart';

import '../general_parameter.dart';

class NavigateDrawer extends StatelessWidget {
  AuthService authService = AuthService();
  Future<Null> handleSignOut() async {
    await authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: AutoSizeText(
                'EFK',
                maxLines: 1,
                style: GoogleFonts.audiowide(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.white.withOpacity(0.7),
                ),
              ),
            ),
            decoration: BoxDecoration(
                color: primaryColor,
                // shape: BoxShape.circle,
                // border: Border.all(color: Colors.pink),
                image: DecorationImage(
                    image: AssetImage('assets/cover.jpg'), fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () {
              Navigator.pushNamed(context, RouteName.home);
            },
          ),
          ListTile(
              leading: Icon(
                Icons.import_contacts,
              ),
              title: Text(
                'Learned Words',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pushNamed(context, RouteName.review);
              }),
          ListTile(
              leading: Icon(
                Icons.games,
              ),
              title: Text(
                'Game',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pushNamed(context, RouteName.gameForWeb);
              }),
          ListTile(
              leading: Icon(
                Icons.school,
              ),
              title: Text(
                'Ranking Table',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pushNamed(context, RouteName.expRankForWeb);
              }),
          ListTile(
              leading: Icon(
                Icons.account_circle,
              ),
              title: Text(
                'Account',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                Navigator.pushNamed(context, RouteName.profileForWeb);
              }),
          ListTile(
              leading: Icon(
                Icons.exit_to_app,
              ),
              title: Text(
                'Sign Out',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () {
                handleSignOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, RouteName.login, (Route<dynamic> route) => false);
              }),
        ],
      ),
    );
  }
}
