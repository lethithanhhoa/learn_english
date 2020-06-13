import 'package:flutter/material.dart';

class Speaker extends StatelessWidget {
  double size;
  Speaker({this.size});
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.volume_up,
      size: size,
      color: Colors.blue[300],
    );
  }
}
