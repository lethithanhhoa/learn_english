import 'package:flutter/material.dart';
import 'screens/login/login_page.dart';
import 'screens/home/home_page.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn English',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          scaffoldBackgroundColor: Color(0XFFEFF3F6)),
      home: HomePage(),
    );
  }
}
