import 'package:flutter/material.dart';
import 'package:learn_english/ui/page_models/vocab/vocabulary_provider.dart';
import 'package:learn_english/ui/pages/home_page.dart';
import 'package:learn_english/ui/pages/login_page.dart';
import 'package:learn_english/ui/pages/setting_page.dart';

class Router {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'LoginPage':
        return MaterialPageRoute(builder: (context) => LoginPage());
      case 'HomePage':
        return MaterialPageRoute(builder: (context) => HomePage());
      case 'Vocab':
        {
          String lessonId = settings.arguments as String;
          return MaterialPageRoute(
              builder: (context) => VocabularyProvider(
                    lessonId: lessonId,
                  ));
        }
      case 'SettingPage':
        return MaterialPageRoute(builder: (context) => SettingPage());

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
