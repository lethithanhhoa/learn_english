import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sa_anicoto/sa_anicoto.dart';
import 'package:supercharged/supercharged.dart';

class TapTapAnimatedWidget extends StatefulWidget {
  @override
  _TapTapAnimatedWidgetState createState() => _TapTapAnimatedWidgetState();
}

class _TapTapAnimatedWidgetState extends State<TapTapAnimatedWidget>
    with AnimationMixin {
  // Add AnimationMixin to state class

  Animation<double> size; // Declare animation variable

  @override
  void initState() {
    size = 0.0.tweenTo(200.0).animatedBy(
        controller); // Connect tween and controller and apply to animation variable
    controller.play(); // Start the animation playback
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.value, // Use animation variable's value here
      height: size.value,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        // image: DecorationImage(image: Image.asset('assets/eye.jpg').image, fit: BoxFit.fill)
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: Image.asset('assets/eye.jpg').image,
                    fit: BoxFit.scaleDown))),
      ),
    );
  }
}
