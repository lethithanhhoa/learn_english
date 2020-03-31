import 'package:cloud_firestore/cloud_firestore.dart';

class Vocabulary {
  String vocabId;
  String vocab;
  String mean;
  String image;
  String audioFile;
  int type;
  List<dynamic> otherWord;

  Vocabulary(
      {this.vocabId,
      this.vocab,
      this.mean,
      this.image,
      this.audioFile,
      this.type,
      this.otherWord});

  factory Vocabulary.fromSnapshot(DocumentSnapshot snapshot) {
    return Vocabulary(
      vocabId: snapshot.documentID,
      vocab: snapshot.data['vocab'],
      mean: snapshot.data['mean'],
      image: snapshot.data['image'],
      audioFile: snapshot.data['audioFile'],
      type: snapshot.data['type'],
      otherWord: snapshot.data['otherWord']
    );
  }

  factory Vocabulary.fromJson(Map<String, dynamic> data) {
    return Vocabulary(
      vocabId: data['id'],
      vocab: data['vocab'],
      mean: data['mean'],
      image: data['image'],
      audioFile: data['audioFile'],
      type: data['type'],
      otherWord: data['otherWord']
    );
  }
}
