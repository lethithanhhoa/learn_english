

import 'package:flutter/material.dart';
import 'package:learn_english/ui/page_models/vocab/vocabulary_provider.dart';
import 'package:learn_english/ui/pages/account_page.dart';
import 'package:learn_english/ui/pages/conversation_page.dart';
import 'package:learn_english/ui/pages/course_page.dart';
import 'package:learn_english/ui/pages/home_page.dart';
import 'package:learn_english/ui/pages/listen_and_chant_page.dart';
import 'package:learn_english/ui/pages/listen_and_repeat_page.dart';
import 'package:learn_english/ui/pages/login_page.dart';
import 'package:learn_english/ui/pages/song_page.dart';

class Router {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'LoginPage':
        return MaterialPageRoute(builder: (context) => LoginPage());
      case 'HomePage':
        return MaterialPageRoute(builder: (context) => HomePage());
      case 'Vocab': {
        String lessonId = settings.arguments as String;
        return  MaterialPageRoute(
            builder: (context) => VocabularyProvider(
                  lessonId: lessonId,
                ));
      }
        
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

      case 'ListenAndRepeatPage':
        List<String> arg = settings.arguments as List<String>;
        return MaterialPageRoute(
            builder: (context) => ListenAndRepeatPage(
                  bookId: arg[0],
                  unitId: arg[1],
                ));
      case 'ListenAndChantPage':
        List<String> arg = settings.arguments as List<String>;
        return MaterialPageRoute(
            builder: (context) => ListenAndChantPage(
                  bookId: arg[0],
                  unitId: arg[1],
                ));

      case 'ConversationPage':
        List<String> arg = settings.arguments as List<String>;
        return MaterialPageRoute(
            builder: (context) => ConversationPage(
                  bookId: arg[0],
                  unitId: arg[1],
                ));
      case 'SongPage':
        List<String> arg = settings.arguments as List<String>;
        return MaterialPageRoute(
            builder: (context) => SongPage(
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
