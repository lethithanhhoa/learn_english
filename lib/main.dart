import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/ui/general_parameter.dart';
import 'package:learn_english/ui/modules/home/home_page.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/modules/router.dart';
import 'package:learn_english/ui/modules/start_app/splash_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EFK',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: primaryColor,
        scaffoldBackgroundColor: Color(0xFFFFFFFF),
        //  Color(0XFFEFF3F6),
        textTheme: GoogleFonts.handleeTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      // home: HomePage(initialHomePage: 0, initialRankPage: 0,),
      home: SplashPage(),
      initialRoute: RouteName.start,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
