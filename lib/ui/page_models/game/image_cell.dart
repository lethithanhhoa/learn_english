import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/page_models/game/cell.dart';

class ImageCell extends Cell {
  Vocabulary vocabulary;
  ImageCell({this.vocabulary}) : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(5.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration: BoxDecoration(
            
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                  image: Image.network(vocabulary.image).image,
                  fit: BoxFit.scaleDown),
            ),
          ),
        ),
      ),
    );
  }
}
