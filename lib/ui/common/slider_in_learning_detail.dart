import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SliderInLearningDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            Icons.close,
            color: Colors.pink,
            size: 40.0,
          ),
          Container(
            color: Colors.blue,
            height: 50,
            width: 200,
            child: Slider(
              value: 4.0,
              onChanged: null,
              min: 1.0,
              max: 5.0,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                Icons.tag_faces,
                color: Colors.pink,
                size: 30,
              ),
              Icon(
                Icons.text_format,
                color: Colors.pink,
                size: 30,
              )
            ],
          ),
        ],
      ),
    );
  }
}
