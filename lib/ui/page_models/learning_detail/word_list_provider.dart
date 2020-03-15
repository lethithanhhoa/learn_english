import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/word.dart';
import 'package:learn_english/core/services/database_service.dart';
import 'package:learn_english/ui/page_models/learning_detail/speech.dart';
import 'package:provider/provider.dart';

class WordsListProvider extends StatelessWidget {
  Database _unitService = new Database();
  String bookId;
  String unitId;
  WordsListProvider({this.bookId, this.unitId});
  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<Word>>.value(
      value: _unitService.getListWord(bookId, unitId),
      child: LearningWord(),
    );
  }
}

class LearningWord extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<List<Word>>(builder: (context, value, child) {
      if (value == null) return Center(child: CircularProgressIndicator());
      // shuffle elements in list
      value.shuffle();
      final _random = new Random();
      List<int> indexScreen = [0, 1, 2, 3];
      var index = -1;
      var element = indexScreen[_random.nextInt(indexScreen.length)];

      // return Center(child: Text('${element}'),);
      switch (element) {
        case 0:
          {
            index++;
            return Speech(
              word: value[index],
            );
          }
        case 1:
          {
            index++;
            return Speech(
              word: value[index],
            );
          }
        case 2:
          {
            index++;
            return Speech(
              word: value[index],
            );
          }
        case 3:
          {
            index++;
            return Speech(
              word: value[index],
            );
          }
      }

      // return ListView.builder(
      //     itemCount: value.length,
      //     itemBuilder: (context, index) {
      //       if (index >= value.length) return null;
      //       Word currentUnit = value[index];
      //       return ListTile(
      //         title: Container(
      //           height: 100,
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(10.0),
      //             color: Colors.pink[200],
      //           ),
      //           child: Row(
      //             children: <Widget>[

      //               Container(
      //                 margin: EdgeInsets.only(left: 10.0),
      //                 width: 100.0,
      //                 height: 80.0,
      //                 decoration: new BoxDecoration(
      //                     borderRadius: BorderRadius.circular(15.0),
      //                     image: DecorationImage(
      //                       fit: BoxFit.cover,
      //                       image: Image.asset('assets/ba6.jpg').image,
      //                       // image: new NetworkImage(''),
      //                     ),
      //                     color: Colors.white),
      //               ),
      //               SizedBox(width: 15),
      //               Flexible(
      //                 child: Padding(
      //                   padding: const EdgeInsets.only(right: 10.0),
      //                   child: Container(
      //                       child: Text(
      //                     '${currentUnit.word}',
      //                     textAlign: TextAlign.start,
      //                     style: new TextStyle(
      //                       color: Colors.black54,
      //                       fontSize: 16,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                     overflow: TextOverflow.fade,
      //                   )),
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //         // onTap: () {
      //         //   Navigator.pushNamed(context, RouteName.learingWord, arguments: [currentUnit.bookId, currentUnit.unitId]);
      //         // }
      //       );
      //     });
    });
  }
}
