import 'package:cloud_firestore/cloud_firestore.dart';

class Vocabulary {
  String lessonId;
  String vocabId;
  String vocab;
  String mean;
  String image;
  String audioFile;
  // int timeStartAudio;
  // int timeEndAudio;
  int type;
  List<dynamic> otherWord;

  Vocabulary({
    this.lessonId,
    this.vocabId,
    this.vocab,
    this.mean,
    this.image,
    this.audioFile,
    // this.timeStartAudio,
    // this.timeEndAudio,
    this.type,
    this.otherWord,
  });

  factory Vocabulary.fromSnapshot(DocumentSnapshot snapshot) {
    return Vocabulary(
        vocabId: snapshot.documentID,
        lessonId: snapshot.data['lessonId'],
        vocab: snapshot.data['vocab'],
        mean: snapshot.data['mean'],
        image: snapshot.data['imgName'],
        audioFile: snapshot.data['audioFile'],
        // timeStartAudio: snapshot.data['timeStartAudio'],
        // timeEndAudio: snapshot.data['timeEndAudio'],
        type: snapshot.data['type'],
        otherWord: snapshot.data['otherWord']);
  }

  factory Vocabulary.fromJson(Map<String, dynamic> data) {
    return Vocabulary(
      vocabId: data['id'],
      lessonId: data['lessonId'],
      vocab: data['vocab'],
      mean: data['mean'],
      image: data['imgName'],
      audioFile: data['audioFile'],
      // timeStartAudio: data['timeStartAudio'],
      // timeEndAudio: data['timeEndAudio'],
      type: data['type'],
      otherWord: data['otherWord'],
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
