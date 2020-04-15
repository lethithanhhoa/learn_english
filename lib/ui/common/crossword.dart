import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learn_english/ui/state/state_of_crossword_list.dart';

import 'package:provider/provider.dart';

class CrossWord extends StatelessWidget {
  String text;
  int position;
  CrossWord({this.text});
  @override
  Widget build(BuildContext context) {
    // error because provider must build again
    StateOfCrossWordList stateOfCrossWordList =
        Provider.of<StateOfCrossWordList>(context);
   

    return Padding(
      padding: EdgeInsets.all(3.0),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 13, 15, 13),
              child: Text(
                text,
                style: TextStyle(fontSize: 20, color: Colors.grey[300]),
              ),
            ),
          ),
          Positioned(
            top: 1,
            right: 2,
            left: 2,
            bottom: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: null,
                child: Text(
                  text,
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
