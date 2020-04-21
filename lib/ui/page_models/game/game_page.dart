import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/core/services/database_service.dart';
import 'package:learn_english/ui/page_models/game/tap_tap_game.dart';
import 'package:learn_english/ui/pages/loading_page.dart';
import 'package:provider/provider.dart';
import 'package:learn_english/ui/page_models/game/matrix_2by2_state.dart';

class GamePage extends StatefulWidget {
  _GameState createState() => _GameState();
}

class _GameState extends State<GamePage> {
  List<Vocabulary> list = [];
  Database database = Database();
  List<String> lessonList = [
    'lesson_1',
    'lesson_2',
    // 'lesson_3',
  ];
  @override
  void initState() {
    super.initState();
    getVocabListToPlayGame();
  }

  getVocabListToPlayGame() {
    lessonList.forEach((lessonId) {
      database.getListOfVocab(lessonId).then((vocabList) {
        vocabList.forEach((data) {
          
            if(data.type == 1 
            
            // || data.type == 2
            ){
              setState(() {
              list.add(data);
              });
            }
            
          
        });
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return (list.length == 0)? LoadingPage()
    : Scaffold(
      backgroundColor: Colors.green[200],
      body: Center(child: TapTapGame(vocabList: list,),),
      
    );
  }
}
