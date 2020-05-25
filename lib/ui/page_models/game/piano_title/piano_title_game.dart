import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/modules/route_name.dart';
import 'package:flip_panel/flip_panel.dart';

class PianoTitleGame extends StatelessWidget {
  List<Vocabulary> listVocab;
  PianoTitleGame({this.listVocab});
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
                  Navigator.pushNamed(context, RouteName.detail_taptap,
                      arguments: listVocab);
                },
                child: Text('Next'),
                color: Colors.blue,
              ),
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
