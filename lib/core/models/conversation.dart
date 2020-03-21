import 'package:cloud_firestore/cloud_firestore.dart';

class Conversation{
  String bookId;
  String unitId;
  String conversationId;
  String audioFile;
  String imgName;
  List<dynamic> content;

  Conversation({this.bookId, this.unitId, this.conversationId, this.audioFile, this.imgName, this.content});

  factory Conversation.fromSnapshot(DocumentSnapshot snapshot){
    return Conversation(
      bookId : snapshot.data['bookId'],
      unitId: snapshot.data['unitId'],
      conversationId : snapshot.documentID,
      audioFile: snapshot.data['audioFile'],
      imgName: snapshot.data['imgName'],
      content: snapshot.data['content'],
    );
  }

  factory Conversation.fromJson(Map<String, dynamic> data){
    return Conversation(
      bookId : data['bookId'],
      unitId: data['unitId'],
      conversationId: data['id'],
      audioFile: data['audioFile'],
      imgName: data['imgName'],
      content: data['content'],
    );
  }
}