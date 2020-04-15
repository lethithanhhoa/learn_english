import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderInLessonList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width - 80,
              color: Colors.green,
              ),
            Container(
              height: 2,
              width: MediaQuery.of(context).size.width - 120,
              color: Colors.pink,
              ),
            
          ],
        ),
        Container(
          width: 40,
          child: Text('50%', style: TextStyle(fontSize: 15),),),
      ],
    );
  }
  
}