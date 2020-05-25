import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/page_models/game/taptap/widget/cell.dart';

class ImageCell extends Cell {
  Vocabulary vocabulary;
  double textSize;
  double borderRadius;
  double padding;
  ImageCell({this.vocabulary, this.textSize, this.borderRadius, this.padding})
      : super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
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
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Container(
                  alignment: Alignment.center,
                  child: Image.network(vocabulary.image),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(borderRadius),
                  //   image: DecorationImage(
                  //       image: Image.network(vocabulary.image).image,
                  //       fit: BoxFit.scaleDown),
                  // ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.fromLTRB(borderRadius / 2, 0, borderRadius / 2, 0),
              child: Center(
                child: AutoSizeText(
                  vocabulary.mean,
                  maxLines: 1,
                  minFontSize: 5,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.charm(
                    textStyle: TextStyle(
                      color: Colors.blue[400],
                      fontSize: textSize,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
