import 'package:auto_size_text/auto_size_text.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/provider/memory_card_state.dart';
import 'package:provider/provider.dart';

class UnitCard extends StatelessWidget {
  Vocabulary vocabulary;
  int seconds;
  GlobalKey<FlipCardState> keyCard = GlobalKey<FlipCardState>();
  UnitCard({this.vocabulary, this.seconds});

  bool loading = true;
  @override
  Widget build(BuildContext context) {
    MemoryCardState memoryCardState = Provider.of<MemoryCardState>(context);
    if (loading && memoryCardState.checking == 0) {
      Future.delayed(Duration(seconds: seconds), () {
        keyCard.currentState.toggleCard();
        Future.delayed(Duration(seconds: seconds), () {
          keyCard.currentState.toggleCard();
          memoryCardState.setTapFalse();
        });
      });
      loading = false;
    }
    return Padding(
      padding: EdgeInsets.all(4.0),
      child: FlipCard(
          key: keyCard,
          flipOnTouch: false,
          front: GestureDetector(
            onTap: (!memoryCardState.isTaped)
                ? () {
                    memoryCardState.submitAnswer(vocabulary.vocab);
                    keyCard.currentState.toggleCard();
                  }
                : null,
            child: Container(
              height: 90,
              width: 135,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Text('?',
                    style: GoogleFonts.piedra(
                      color: Colors.white,
                      fontSize: 50,
                    )),
              ),
            ),
          ),
          back: Container(
            height: 90,
            width: 135,
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.9),
                borderRadius: BorderRadius.circular(5.0)),
            child: Center(
                child: Padding(
              padding: EdgeInsets.all(5.0),
              child: AutoSizeText(
                vocabulary.vocab,
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            )),
          )),
    );
  }
}
