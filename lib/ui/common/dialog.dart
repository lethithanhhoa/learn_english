import 'package:flutter/material.dart';
import 'package:learn_english/ui/modules/route_name.dart';

class MyDialog extends StatelessWidget {
  String unitName;
  String unitId;
  String bookId;
  MyDialog({this.unitName, this.unitId, this.bookId});
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: Text(unitName,
          style: TextStyle(
            color: Colors.pink,
            fontWeight: FontWeight.bold,
          )),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      children: <Widget>[
        SimpleDialogOption(
          onPressed: () {
            Navigator.pushNamed(context, RouteName.listenAndRepeatPage,
                arguments: [bookId, unitId]);
          },
          child: Container(
              height: 30.0,
              alignment: Alignment.centerLeft,
              child: Text(
                'Lesson 1: Listen and repeat.',
                maxLines: 2,
                overflow: TextOverflow.fade,
                softWrap: true,
                style: TextStyle(color: Colors.black54, fontSize: 18),
              )),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pushNamed(context, RouteName.listenAndChantPage,
                arguments: [bookId, unitId]);
          },
          child: Container(
              height: 30.0,
              alignment: Alignment.centerLeft,
              child: Text(
                'Lesson 2: Listen and chant.',
                maxLines: 2,
                overflow: TextOverflow.fade,
                softWrap: true,
                style: TextStyle(color: Colors.black54, fontSize: 18),
              )),
        ),
        SimpleDialogOption(
          onPressed: (){
            Navigator.pushNamed(context, RouteName.conversationPage,
                arguments: [bookId, unitId]);
          },
          child: Container(
              height: 30.0,
              alignment: Alignment.centerLeft,
              child: Text(
                'Lesson 3: Let’s talk.',
                maxLines: 2,
                overflow: TextOverflow.fade,
                softWrap: true,
                style: TextStyle(color: Colors.black54, fontSize: 18),
              )),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pushNamed(context, RouteName.songPage,
                arguments: [bookId, unitId]);
          },
          child: Container(
              height: 30.0,
              alignment: Alignment.centerLeft,
              child: Text(
                'Lesson 4: Let’s sing.',
                maxLines: 2,
                overflow: TextOverflow.fade,
                softWrap: true,
                style: TextStyle(color: Colors.black54, fontSize: 18),
              )),
        ),
        SimpleDialogOption(
          onPressed: null,
          child: Container(
              height: 30.0,
              alignment: Alignment.centerLeft,
              child: Text(
                'Review.',
                maxLines: 2,
                overflow: TextOverflow.fade,
                softWrap: true,
                style: TextStyle(color: Colors.black54, fontSize: 18),
              )),
        ),
      ],
    );
  }
}
