import 'package:cloud_firestore/cloud_firestore.dart';

class Song{
  String bookId;
  String unitId;
  String songId;
  String audioFile;
  String imgName;
  List<dynamic> content;

  Song({this.bookId, this.unitId, this.songId, this.audioFile, this.imgName, this.content});

  factory Song.fromSnapshot(DocumentSnapshot snapshot){
    return Song(
      bookId : snapshot.data['bookId'],
      unitId: snapshot.data['unitId'],
      songId : snapshot.documentID,
      audioFile: snapshot.data['audioFile'],
      imgName: snapshot.data['imgName'],
      content: snapshot.data['content'],
    );
  }

  factory Song.fromJson(Map<String, dynamic> data){
    return Song(
      bookId : data['bookId'],
      unitId: data['unitId'],
      songId: data['id'],
      audioFile: data['audioFile'],
      imgName: data['imgName'],
      content: data['content'],
    );
  }
}