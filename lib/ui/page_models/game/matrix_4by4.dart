import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/page_models/game/cell.dart';
import 'package:learn_english/ui/page_models/game/image_cell.dart';
import 'package:learn_english/ui/page_models/game/score.dart';
import 'package:learn_english/ui/page_models/game/text_cell.dart';
import 'package:provider/provider.dart';

class Matrix4By4 extends StatelessWidget {
  List<Vocabulary> vocabList;
  Matrix4By4({this.vocabList});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Score(),
        ),
      ],
      child: Matrix4By4Page(
        vocabList: vocabList,
      ),
    );
  }
}

class Matrix4By4Page extends StatelessWidget {
  List<Vocabulary> vocabList;
  Matrix4By4Page({this.vocabList});
  List<Cell> widgets;
  int firstIndex = 0;
  int secondIndex = 0;
  int thirdIndex = 0;
  int forIndex = 0;
  int fiveIndex = 0;
  int sixIndex = 0;
  int sevenIndex = 0;
  int eightIndex = 0;
  @override
  Widget build(BuildContext context) {
    Score score = Provider.of<Score>(context);

    Random random = Random();
    firstIndex = random.nextInt(vocabList.length);
    secondIndex = random.nextInt(vocabList.length);
    thirdIndex = random.nextInt(vocabList.length);
    forIndex = random.nextInt(vocabList.length);
    fiveIndex = random.nextInt(vocabList.length);
    sixIndex = random.nextInt(vocabList.length);
    sevenIndex = random.nextInt(vocabList.length);
    eightIndex = random.nextInt(vocabList.length);

    widgets = [
      ImageCell(vocabulary: vocabList[firstIndex], textSize: 15,),

      TextCell(
        vocabulary: vocabList[firstIndex],
        textSize: 30,
      ),
      ImageCell(
        vocabulary: vocabList[secondIndex],
        textSize: 15,
      ),
      TextCell(
        vocabulary: vocabList[secondIndex],
        textSize: 30,
      ),
      ImageCell(
        vocabulary: vocabList[thirdIndex],
        textSize: 15,
      ),
      TextCell(
        vocabulary: vocabList[thirdIndex],
        textSize: 30,
      ),
      ImageCell(
        vocabulary: vocabList[forIndex],
        textSize: 15,
      ),
      TextCell(
        vocabulary: vocabList[forIndex],
        textSize: 30,
      ),
      ImageCell(vocabulary: vocabList[fiveIndex], textSize: 15,),
      TextCell(
        vocabulary: vocabList[fiveIndex],
        textSize: 30,
      ),
      ImageCell(
        vocabulary: vocabList[sixIndex],
        textSize: 15,
      ),
      TextCell(
        vocabulary: vocabList[sixIndex],
        textSize: 30,
      ),
      ImageCell(
        vocabulary: vocabList[sevenIndex],
        textSize: 15,
      ),
      TextCell(
        vocabulary: vocabList[sevenIndex],
        textSize: 30,
      ),
      ImageCell(
        vocabulary: vocabList[eightIndex],
        textSize: 15,
      ),
      TextCell(
        vocabulary: vocabList[eightIndex],
        textSize: 30,
      ),
    ];
    widgets.shuffle();

    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          
          child: Column(
            
            children: <Widget>[
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(child: Padding(
                      padding: EdgeInsets.all(2.5),
                      child: Transform.scale(
                        scale: 1.05,
                        child: widgets[0]),
                    ),),
                    Expanded(child: Padding(
                      padding:  EdgeInsets.all(2.5),
                      child: widgets[1],
                    ),),
                    Expanded(child: Padding(
                      padding:  EdgeInsets.all(2.5),
                      child: widgets[2],
                    ),),
                    Expanded(child: Padding(
                      padding:  EdgeInsets.all(2.5),
                      child: widgets[3],
                    ),),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(child: Padding(
                      padding: EdgeInsets.all(2.5),
                      child: widgets[4],
                    ),),
                    Expanded(child: Padding(
                      padding:  EdgeInsets.all(2.5),
                      child: widgets[5],
                    ),),
                    Expanded(child: Padding(
                      padding:  EdgeInsets.all(2.5),
                      child: widgets[6],
                    ),),
                    Expanded(child: Padding(
                      padding:  EdgeInsets.all(2.5),
                      child: widgets[7],
                    ),),
                  ],
                ),
              ),
                  
      
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(child: Padding(
                      padding: EdgeInsets.all(2.5),
                      child: widgets[8],
                    ),),
                    Expanded(child: Padding(
                      padding:  EdgeInsets.all(2.5),
                      child: widgets[9],
                    ),),
                    Expanded(child: Padding(
                      padding:  EdgeInsets.all(2.5),
                      child: widgets[10],
                    ),),
                    Expanded(child: Padding(
                      padding:  EdgeInsets.all(2.5),
                      child: widgets[11],
                    ),),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(child: Padding(
                      padding: EdgeInsets.all(2.5),
                      child: widgets[12],
                    ),),
                    Expanded(child: Padding(
                      padding:  EdgeInsets.all(2.5),
                      child: widgets[13],
                    ),),
                    Expanded(child: Padding(
                      padding:  EdgeInsets.all(2.5),
                      child: widgets[14],
                    ),),
                    Expanded(child: Padding(
                      padding:  EdgeInsets.all(2.5),
                      child: widgets[15],
                    ),),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
