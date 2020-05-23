import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sa_anicoto/sa_anicoto.dart';
import 'package:supercharged/supercharged.dart';

class TapTapAnimatedWidget extends StatefulWidget {
  String title;
  String imageName;
  TapTapAnimatedWidget({this.title, this.imageName});
  @override
  _TapTapAnimatedWidgetState createState() => _TapTapAnimatedWidgetState();
}

class _TapTapAnimatedWidgetState extends State<TapTapAnimatedWidget>
    with AnimationMixin {
  // Add AnimationMixin to state class

  Animation<double> size; // Declare animation variable

  @override
  void initState() {
    size = 0.0.tweenTo(250.0).animatedBy(
        controller); // Connect tween and controller and apply to animation variable
    controller.play(duration: Duration(milliseconds: 900)); // Start the animation playback
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Container(
        width: size.value, // Use animation variable's value here
        height: size.value / 3,
        // alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green[200].withOpacity(0.9),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                height: size.value / 3,
                width: size.value / 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    image: DecorationImage(
                        image:
                            Image.asset('assets/' + widget.imageName).image)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: AutoSizeText(
                  widget.title,
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7), fontSize: 27),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
