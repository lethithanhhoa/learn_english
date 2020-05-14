import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/core/services/vocab_service.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:learn_english/ui/pages/loading_page.dart';
import 'package:learn_english/ui/pages/login_page.dart';

class GamePage extends StatefulWidget {
  _GameState createState() => _GameState();
}

class _GameState extends State<GamePage> {
  VocabService _vocabService = VocabService();
  List<Vocabulary> vocabList = [];
  List<Vocabulary> vocabListByType = [];

  @override
  void initState() {
    super.initState();
    _vocabService.getAllVocab().then((value) {
      setState(() {
        vocabList = value;
      });
      value.forEach((element) {
        if (element.type == 1 || element.type == 2) {
          setState(() {
            vocabListByType.add(element);
          });
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteName.taptap,
                  arguments: vocabListByType);
            },
            child: Text('TapTap'),
            color: Colors.blue,
          ),
          FlatButton(
            onPressed: () {
              // Navigator.pushNamed(context, RouteName.taptap,
              //     arguments: vocabListByType);
            },
            child: Text('Flappy Bird'),
            color: Colors.blue,
          )
        ],
      )),
    );
  }
}
