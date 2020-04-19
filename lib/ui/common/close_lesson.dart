import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/ui/modules/route_name.dart';

class CloseLesson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(0.0),
      onPressed: () {
        showDialog(
          context: context,
          child: AlertDialog(
            title: Text('Do you want exit this lesson?'),
            content: Text('If you exit this lesson, the result wont be saved.'),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, RouteName.homePage,
                        (Route<dynamic> route) => false);
                  },
                  child: Text('Exit')),
              FlatButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text('Cancel')),
            ],
          ),
        );
      },
      icon: Icon(
        Icons.close,
        size: 30,
      ),
      color: Colors.white.withOpacity(0.5),
    );
  }
}
