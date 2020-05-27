import 'package:flutter/material.dart';

class Speaker extends StatelessWidget {
  double size;
  Speaker({this.size});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: Image.asset('assets/high-volume.png').image,
            fit: BoxFit.scaleDown),
      ),
    );
  }
}
