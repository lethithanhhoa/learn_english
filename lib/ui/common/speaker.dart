import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Speaker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: Image.asset('assets/high-volume.png').image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
