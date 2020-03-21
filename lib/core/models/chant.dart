import 'package:cloud_firestore/cloud_firestore.dart';

class Chant{
  String bookId;
  String unitId;
  String chantId;
  String audioFile;
  List<dynamic> content;

  Chant({this.bookId, this.unitId, this.chantId, this.audioFile, this.content});

  factory Chant.fromSnapshot(DocumentSnapshot snapshot){
    return Chant(
      bookId : snapshot.data['bookId'],
      unitId: snapshot.data['unitId'],
      chantId : snapshot.documentID,
      audioFile: snapshot.data['audioFile'],
      content: snapshot.data['content'],
    );
  }

  factory Chant.fromJson(Map<String, dynamic> data){
    return Chant(
      bookId : data['bookId'],
      unitId: data['unitId'],
      chantId: data['id'],
      audioFile: data['audioFile'],
      content: data['content'],
    );
  }
}