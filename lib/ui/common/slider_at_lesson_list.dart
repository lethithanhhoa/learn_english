import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderAtLessonList extends StatelessWidget{
  int percent = 0;
  SliderAtLessonList({this.percent});
  List<Color> colors = [
    Colors.red[600],
    Colors.orange[600],
    Colors.yellow[600],
    Colors.green[600],
  ];
  @override
  Widget build(BuildContext context) {
    var temp;
    if (percent <= 40) temp = colors[0];
    else if (percent > 40 && percent <= 60) temp = colors[1];
    else if (percent > 60 && percent <= 90) temp = colors[2];
    if (percent == 100) temp = colors[3];
    return Stack(
      children: <Widget>[
        Container(
          height: 3,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey[400],
        ),
        Container(
          height: 3,
          width: percent / 100 * MediaQuery.of(context).size.width,
          color: temp,
        ),
      ],
    );
    
  }
  
}