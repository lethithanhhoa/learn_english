import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderAtLessonList extends StatelessWidget {
  int percent = 0;
  SliderAtLessonList({this.percent});
  List<Color> colors = [
    Colors.red,
    Colors.orange,
    Colors.teal,
    Colors.green[600],
    Colors.grey,
  ];
  @override
  Widget build(BuildContext context) {
    var temp;
    if (percent > 0 && percent <= 40)
      temp = colors[0];
    else if (percent > 40 && percent <= 60)
      temp = colors[1];
    else if (percent > 60 && percent < 100)
      temp = colors[2];
    else if (percent == 100)
      temp = colors[3];
    else if (percent == 0) temp = colors[4];
    return Container(
      // color: Colors.pink,
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 5,
                width: MediaQuery.of(context).size.width - 90,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(3.0),
                ),
              ),
              Container(
                height: 5,
                width: percent / 100 * (MediaQuery.of(context).size.width - 90),
                decoration: BoxDecoration(
                  color: temp,
                  borderRadius: BorderRadius.circular(3.0),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 3),
            child: Container(
                width: 35,
                child: AutoSizeText(
                  '${percent}%',
                  maxLines: 1,
                  style: TextStyle(color: temp, fontSize: 10),
                )),
          ),
        ],
      ),
    );
  }
}
