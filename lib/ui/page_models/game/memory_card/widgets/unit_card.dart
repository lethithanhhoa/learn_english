import 'package:auto_size_text/auto_size_text.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/page_models/game/memory_card/state/memory_card_state.dart';
import 'package:provider/provider.dart';

class UnitCard extends StatelessWidget {
  Vocabulary vocabulary;
  int seconds;
  bool loading = true;
  GlobalKey<FlipCardState> keyCard = GlobalKey<FlipCardState>();
  UnitCard({this.vocabulary, this.seconds});

  @override
  Widget build(BuildContext context) {
    MemoryCardState memoryCardState = Provider.of<MemoryCardState>(context);
    if (loading && memoryCardState.checking == 0) {
      Future.delayed(Duration(seconds: 1), () {
        keyCard.currentState.toggleCard();
        Future.delayed(Duration(seconds: seconds), () {
          keyCard.currentState.toggleCard();
          // memoryCardState.setIsFlip(true);
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
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(5.0)),
              
              child: Center(
                  child: Text(
                '?',
                style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
              )),
            ),
          ),
          back: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.9),
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
