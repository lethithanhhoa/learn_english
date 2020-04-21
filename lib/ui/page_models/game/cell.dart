import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';

class Cell extends StatelessWidget{
  Vocabulary vocabulary;
  Cell({this.vocabulary});
  @override
  Widget build(BuildContext context) {
    return null;
    // Padding(
    //   padding:  EdgeInsets.all(5.0),
    //   child: Container(
    //     height: MediaQuery.of(context).size.height,
    //     width: MediaQuery.of(context).size.width,
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(15.0),
    //     ),
    //     child: Container(
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(15.0),
    //       ),
    //       child: Center(
    //         child: Text(
    //           vocabulary.vocab,
    //           style: TextStyle(fontSize: 40, 
    //           color: Colors.blue[200]
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // ); 
}
}