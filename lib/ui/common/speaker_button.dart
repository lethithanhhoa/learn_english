import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpeakerButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.center,
      height: 70,
      width: 70,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(15.0)),
          ),
          Positioned(
            top: 1,
            right: 3,
            left: 3,
            bottom: 6,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12.0)
              ),
              child: IconButton(
                
                  icon: Icon(
                    Icons.volume_up,
                    size: 50,
                    color: Colors.blue,
                  ),
                  onPressed: null),
            ),
          )
        ],
      ),
    );
  }
}
