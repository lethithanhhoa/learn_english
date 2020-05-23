import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/page_models/game/taptap/end_game_page.dart';
import 'package:learn_english/ui/page_models/game/taptap/taptap_game.dart';
import 'package:learn_english/ui/page_models/game/taptap/taptap_detail_page.dart';
import 'package:learn_english/ui/page_models/review_words/detail_word_page.dart';
import 'package:learn_english/ui/page_models/review_words/learned_words_page.dart';
import 'package:learn_english/ui/page_models/vocab/vocabulary_page.dart';
import 'package:learn_english/ui/pages/home_page.dart';
import 'package:learn_english/ui/pages/login_page.dart';
import 'package:learn_english/ui/pages/starting_page.dart';

class Router {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'StartingPage':
        return MaterialPageRoute(builder: (context) => StartingPage());
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

      case 'LearnedWords':
        return MaterialPageRoute(builder: (context) => LearnedWordsPage());

      case 'EndGame':
        return MaterialPageRoute(builder: (context) => EndGamePage());
        
      case 'DetailWord':
        {
          List<dynamic> arg = settings.arguments as List<dynamic>;
          return MaterialPageRoute(
              builder: (context) => DetailWordPage(
                    vocabList: arg[0],
                    index: arg[1],
                  ));
        }

      case 'TapTap':
        {
          List<Vocabulary> vocabList = settings.arguments as List<Vocabulary>;
          return MaterialPageRoute(
              builder: (context) => TapTapGame(
                    listVocab: vocabList,
                  ));
        }

      case 'TapTapDetail':
        {
          List<Vocabulary> vocabList = settings.arguments as List<Vocabulary>;
          return MaterialPageRoute(
              builder: (context) => TapTapDetailPage(
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
