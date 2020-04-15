import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/modules/router.dart';
import 'package:learn_english/ui/pages/home_page.dart';
import 'package:learn_english/ui/pages/loading_page.dart';
import 'package:learn_english/ui/pages/login_page.dart';
import 'package:learn_english/ui/pages/starting_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EFK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        scaffoldBackgroundColor: Color(0XFFEFF3F6),
        textTheme: GoogleFonts.handleeTextTheme(
          Theme.of(context).textTheme,
        ),
      ),

      home: LoginPage(),
      initialRoute: RouteName.loginPage,
      onGenerateRoute: Router.generateRoute,
      // home: StartingPage(),
    );
  }
}
