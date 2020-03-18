import 'package:cloud_firestore/cloud_firestore.dart';

class Unit{
  String bookId;
  String unitId;
  String name;
  String imgName;
  List<dynamic> chant;
  List<dynamic> conversation;
  List<dynamic> song;

  Unit({ this.bookId, this.unitId, this.name, this.imgName, this.chant, this.song, this.conversation});

  factory Unit.fromSnapshot(DocumentSnapshot snapshot){
    return Unit(
      
      bookId : snapshot.data['bookId'],
      unitId : snapshot.documentID,
      name: snapshot.data['unitName'],
      imgName: snapshot.data['imgName'],
      chant: snapshot.data['chant'],
      conversation: snapshot.data['talking'],
      song: snapshot.data['song'],
    );
  }

  factory Unit.fromJson(Map<String, dynamic> data){
    return Unit(
      bookId : data['bookId'],
      unitId: data['id'],
      name: data['unitName'],
      imgName: data['imgName'],
      chant: data['chant'],
      conversation: data['talking'],
      song: data['song'],
    );
  }
}