import 'package:flutter/material.dart';
import 'package:learn_english/ui/pages/course_page.dart';
import 'package:learn_english/ui/pages/home_page.dart';
import 'package:learn_english/ui/pages/learning_word_page.dart';
import 'package:learn_english/ui/pages/login_page.dart';

class Router {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'LoginPage':
        return MaterialPageRoute(builder: (context) => LoginPage());
      case 'HomePage':
        return MaterialPageRoute(builder: (context) => HomePage());
      // case 'Course':
      //   List<String> arg = settings.arguments as List<String>;
      //   return MaterialPageRoute(
      //       builder: (context) => Course(
      //             bookId: arg[0],
      //             bookTitle: arg[1],
      //           ));
      case 'Course':
        List<String> arg = settings.arguments as List<String>;
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => Course(
            bookId: arg[0],
            bookTitle: arg[1],
          ),
          // transitionsBuilder: (context, animation, secondaryAnimation, child) {
          //   return child;
          // },
        );

      case 'LearingWord':
        List<String> arg = settings.arguments as List<String>;
        return MaterialPageRoute(
            builder: (context) => LearningWordPage(
                  bookId: arg[0],
                  unitId: arg[1],

                ));
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
