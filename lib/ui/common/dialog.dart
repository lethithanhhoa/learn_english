import 'package:flutter/material.dart';
import 'package:learn_english/ui/modules/route_name.dart';

class MyDialog extends StatelessWidget{
  String unitName;
  String unitId;
  String bookId;
  MyDialog({this.unitName, this.unitId, this.bookId});
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(unitName),
      children: <Widget>[
        SimpleDialogOption(
          onPressed:(){
            Navigator.pushNamed(context, RouteName.learningWord, arguments: [bookId, unitId]);
          },
          child: Text(bookId),
        ),
        SimpleDialogOption(
          onPressed: null,
          child: Text(unitId),
        ),
      ],
    );
  }
  
}