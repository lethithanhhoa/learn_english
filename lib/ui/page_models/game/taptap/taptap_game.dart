import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/modules/route_name.dart';

class TapTapGame extends StatelessWidget{
  List<Vocabulary> listVocab;
  TapTapGame({this.listVocab});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed: (){
              Navigator.pushNamed(context, RouteName.taptapDetail, arguments: listVocab);
            },
            child: Text('Next'),
            color: Colors.blue,
          ),
          Expanded(
            child: ListView.builder(
        itemCount: listVocab.length,
        itemBuilder: (context, index){
          return Text(listVocab[index].vocab);
      }),
          ),
          
        ]
      )),
      

    );
  }
  
}