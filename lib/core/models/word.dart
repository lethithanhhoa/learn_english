import 'package:cloud_firestore/cloud_firestore.dart';

class Word{
  String unitId;
  String wordId;
  String word;
  String imgName;

  Word({this.unitId, this.wordId, this.word, this.imgName});

  factory Word.fromSnapshot(DocumentSnapshot snapshot){
    return Word(
      unitId : snapshot.data['unitId'],
      wordId: snapshot.documentID,
      word: snapshot.data['word'],
      imgName: snapshot.data['imageName'],
    );
  }

  factory Word.fromJson(Map<String, dynamic> data){
    return Word(
      unitId: data['unitId'],
      wordId: data['id'],
      word: data['word'],
      imgName: data['imageName'],
    );
  }
}
