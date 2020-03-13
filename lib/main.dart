import 'package:flutter/material.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/modules/router.dart';
import 'package:learn_english/ui/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hana Hana',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          scaffoldBackgroundColor: Color(0XFFEFF3F6)),
      home: HomePage(),
      initialRoute: RouteName.loginPage,
      onGenerateRoute: Router.generateRoute,
      
    );
  }
}
