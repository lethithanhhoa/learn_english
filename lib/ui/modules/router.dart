import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/page_models/game/matrix_2by2.dart';
import 'package:learn_english/ui/page_models/game/matrix_4by4.dart';
import 'package:learn_english/ui/page_models/review_words/detail_word.dart';
import 'package:learn_english/ui/page_models/review_words/learned_words_page.dart';
import 'package:learn_english/ui/page_models/vocab/vocabulary_page.dart';
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
              builder: (context) => VocabularyPage(
                    lessonId: lessonId,
                  ));
        }
      case 'SettingPage':
        return MaterialPageRoute(builder: (context) => SettingPage());
      
      case 'LearnedWords':
        return MaterialPageRoute(builder: (context) => LearnedWordsPage());
      case 'DetailWord':{
        List<dynamic> arg = settings.arguments as List<dynamic>;
        return MaterialPageRoute(builder: (context) => DetailWordPage(vocabList: arg[0], index: arg[1],));}

      case 'Matrix2by2':
        {
          List<Vocabulary> vocabList = settings.arguments as List<Vocabulary>;
          return MaterialPageRoute(
              builder: (context) => Matrix2By2(
                    vocabList: vocabList,
                  ));
        }
      case 'Matrix4by4':
        {
          List<Vocabulary> vocabList = settings.arguments as List<Vocabulary>;
          return MaterialPageRoute(
              builder: (context) => Matrix4By4(
                    vocabList: vocabList,
                  ));
        }

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
