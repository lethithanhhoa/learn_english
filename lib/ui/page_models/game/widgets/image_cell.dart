import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/page_models/game/widgets/cell.dart';

class ImageCell extends Cell {
  Vocabulary vocabulary;
  double textSize;
  double borderRadius;
  ImageCell({this.vocabulary, this.textSize, this.borderRadius}) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding:  EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                decoration: BoxDecoration(
                
                  borderRadius: BorderRadius.circular(borderRadius),
                  image: DecorationImage(
                      image: Image.network(vocabulary.image).image,
                      fit: BoxFit.scaleDown),
                ),
              ),
            ),
          ),
          Text(vocabulary.mean, style: TextStyle(color: Colors.blue, fontSize: textSize),),
        ],
      ),
    );
  }
}
