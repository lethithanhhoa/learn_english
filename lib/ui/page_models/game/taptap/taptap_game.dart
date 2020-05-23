import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:flip_panel/flip_panel.dart';

class TapTapGame extends StatelessWidget {
  List<Vocabulary> listVocab;
  TapTapGame({this.listVocab});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
          child: Column(children: <Widget>[
        Column(
          children: [
            FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteName.taptapDetail,
                    arguments: listVocab);
              },
              child: Text('Next'),
              color: Colors.blue,
            ),
            // FlipPanel.builder(
            //     itemBuilder: (context, index) {
            //       return Container(
            //         height: MediaQuery.of(context).size.width,
            //         width: MediaQuery.of(context).size.width,
            //         decoration: BoxDecoration(
            //             image: DecorationImage(
            //                 image: Image.asset('assets/board.jpg').image)),
            //       );
            //     },
            //     itemsCount: 1,
            //     period: Duration(seconds: 1),
            //     loop: 1,
            //     direction: FlipDirection.up,
            //     )
          ],
        ),
        Expanded(
          child: ListView.builder(
              itemCount: listVocab.length,
              itemBuilder: (context, index) {
                return Text(listVocab[index].vocab);
              }),
        ),
      ]),
      ),
    );
  }
}
