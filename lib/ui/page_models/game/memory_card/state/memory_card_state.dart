import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:learn_english/core/models/vocabulary.dart';
import 'package:learn_english/ui/modules/audio_player.dart';
import 'package:learn_english/ui/page_models/game/memory_card/widgets/unit_card.dart';

class MemoryCardState extends ChangeNotifier {
  List<Vocabulary> vocabList;
  MemoryCardState({this.vocabList});
  List<UnitCard> cardList = new List();
  AudioPlayer audioPlayer = AudioPlayer();
  int level = 1;

  String answer;
  String correctVocab;
  int checking = 0;
  bool isFlip = true;
  bool isFinish = false;
  bool isTaped = false;

  setIsFinishTrue() {
    isFinish = true;
    notifyListeners();
  }

  generateCard() {
    if (vocabList.length < level * 2) {
      isFinish = true;
      notifyListeners();
      return;
    }

    List temp = vocabList;
    temp.shuffle();
    correctVocab = temp[0].vocab;
    int maxIndex = level * 2;
    int seconds = 0;
    if (level < 4)
      seconds = 2;
    else if (level < 7)
      seconds = 3;
    else if (level < 11)
      seconds = 4;
    else
      seconds = 5;

    for (int i = 0; i < maxIndex; i++) {
      cardList.add(UnitCard(
        vocabulary: temp[i],
        seconds: seconds,
      ));
    }
    cardList.shuffle();
    Future.delayed(Duration(seconds: seconds + 2), () {
      audioPlayer.playCustomAudioFile(temp[0].audioFile);
    });

    notifyListeners();
  }

  submitAnswer(String text) {
    answer = text;
    isTaped = true;
    checkAnswer();
    notifyListeners();
  }

  checkAnswer() {
    if (answer == correctVocab)
      Future.delayed(Duration(seconds: 1), () {
        checking = 1;
        audioPlayer.playCorrectSound();
        notifyListeners();
      });
    else
      Future.delayed(Duration(seconds: 1), () {
        checking = 2;
        audioPlayer.playWrongSound();
        notifyListeners();
      });
  }

  fetchState() {
    checking = 0;
    isTaped = false;
    correctVocab = '';
    answer = '';
    cardList = [];
    notifyListeners();
  }

  nextLevel() {
    level++;
    generateCard();
    notifyListeners();
  }
}
