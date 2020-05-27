import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/modules/router.dart';
import 'package:learn_english/ui/pages/splash_page.dart';

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
        primarySwatch: Colors.lightGreen,
        scaffoldBackgroundColor: Color(0XFFEFF3F6),
        textTheme: GoogleFonts.handleeTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
     
      home: SplashPage(),
      initialRoute: RouteName.start,
      onGenerateRoute: Router.generateRoute,
    );
  }
}
