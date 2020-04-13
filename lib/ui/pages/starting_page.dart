import 'package:flutter/cupertino.dart';

class StartingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // height: 100,
      // width: 100,
      decoration: BoxDecoration(
        image: DecorationImage(image: Image.asset('assets/hoaanhdao1.gif').image, fit: BoxFit.fill),
      ),
    );
  }
  
}