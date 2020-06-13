import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 150,
              width: 220,
              decoration: BoxDecoration(
                // color: Colors.blue,
                image: DecorationImage(
                    image: Image.asset('assets/tenor.gif').image,
                    fit: BoxFit.fill),
              ),
            ),
            Text('Please wait...',
            style: TextStyle(
              fontSize: 20,
            ),
            ),
          ],
        ),
      ],
    ));
  }
}
