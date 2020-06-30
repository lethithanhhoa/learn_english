import 'package:cloud_firestore/cloud_firestore.dart';

class Vocabulary {
  String lessonId;
  String vocabId;
  String vocab;
  String mean;
  String image;
  String audioFile;
  int type;
  List<dynamic> otherWord;

  Vocabulary({
    this.lessonId,
    this.vocabId,
    this.vocab,
    this.mean,
    this.image,
    this.audioFile,
    this.type,
    this.otherWord,
  });

  factory Vocabulary.fromSnapshot(DocumentSnapshot snapshot) {
    return Vocabulary(
        vocabId: snapshot.data['vocab_id'],
        lessonId: snapshot.data['lesson_id'],
        vocab: snapshot.data['vocab'],
        mean: snapshot.data['mean'],
        image: snapshot.data['image_file'],
        audioFile: snapshot.data['audio_file'],
        type: snapshot.data['type'],
        otherWord: snapshot.data['other_words']);
  }

  factory Vocabulary.fromJson(Map<String, dynamic> data) {
    return Vocabulary(
      vocabId: data['vocab_id'],
      lessonId: data['lesson_id'],
      vocab: data['vocab'],
      mean: data['mean'],
      image: data['image_file'],
      audioFile: data['audio_ile'],
      type: data['type'],
      otherWord: data['other_words'],
    );
  }

  Map<String, dynamic> toMap() {
    String temp = '';
    otherWord.forEach((element) {
      if (temp == '')
        temp = element;
      else
        temp = temp + '/' + element;
    });

    var map = <String, dynamic>{
      'vocabId': vocabId,
      'vocab': vocab,
      'lessonId': lessonId,
      'mean': mean,
      'imageFile': image,
      'audioFile': audioFile,
      // 'timeStartAudio': timeStartAudio,
      // 'timeEndAudio': timeEndAudio,
      'type': type,
      'otherWord': temp,
    };
    return map;
  }

  factory Vocabulary.fromMap(Map<String, dynamic> map) {
    return Vocabulary(
        vocabId: map['vocabId'],
        lessonId: map['lessonId'],
        vocab: map['vocab'],
        mean: map['mean'],
        image: map['imageFile'],
        audioFile: map['audioFile'],
        // timeStartAudio: map['timeStartAudio'],
        // timeEndAudio: map['timeEndAudio'],
        type: map['type'],
        otherWord: map['otherWord'].toString().split('/').toList());
  }
}
