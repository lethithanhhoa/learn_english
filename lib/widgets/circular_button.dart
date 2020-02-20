import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget{
  double radius;
  final Widget icon;

  CircularButton({Key key, this.radius, @required this.icon})
  : super(key: key){
    if (radius == null || radius <= 0) radius = 32;
  }
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(radius/2),
      child: Stack(
        children: <Widget>[
          Container(
            width: radius*2,
            height: radius*2,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(radius),
              boxShadow: [
                BoxShadow(color: Colors.white, offset: Offset(4, 4), blurRadius: 2),
                BoxShadow(color: Colors.pink[300]),
              ],
            ),
          ),
          Positioned.fill(child: icon),
        ],
      ),
    );
  }
}