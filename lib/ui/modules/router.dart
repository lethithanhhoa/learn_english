import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/page_models/game/piano_title/piano_title_game.dart';
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
      case '/':
        return MaterialPageRoute(builder: (context) => StartingPage());

      case '/login':
        return MaterialPageRoute(builder: (context) => LoginPage());
      case '/home':
        return MaterialPageRoute(builder: (context) => HomePage());
      case '/learn':
        {
          String lessonId = settings.arguments as String;
          return MaterialPageRoute(
              builder: (context) => VocabularyPage(
                    lessonId: lessonId,
                  ));
        }

      case '/review':
        return MaterialPageRoute(builder: (context) => LearnedWordsPage());

      case 'end_game':
        return MaterialPageRoute(builder: (context) => EndGamePage());

      case 'detail_review':
        {
          List<dynamic> arg = settings.arguments as List<dynamic>;
          return MaterialPageRoute(
              builder: (context) => DetailWordPage(
                    vocabList: arg[0],
                    index: arg[1],
                  ));
        }

      case 'taptap':
        {
          List<Vocabulary> vocabList = settings.arguments as List<Vocabulary>;
          return MaterialPageRoute(
              builder: (context) => TapTapGame(
                    listVocab: vocabList,
                  ));
        }

      case 'detail_taptap':
        {
          List<Vocabulary> vocabList = settings.arguments as List<Vocabulary>;
          return MaterialPageRoute(
              builder: (context) => TapTapDetailPage(
                    vocabList: vocabList,
                  ));
        }

      case 'piano_title':
        {
          List<Vocabulary> vocabList = settings.arguments as List<Vocabulary>;
          return MaterialPageRoute(
              builder: (context) => PianoTitleGame(
                    listVocab: vocabList,
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
