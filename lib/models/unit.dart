import 'package:cloud_firestore/cloud_firestore.dart';

class Unit{
  String docId;
  String bookId;
  String unitId;
  String name;
  String imgName;

  Unit({this.docId, this.bookId, this.unitId, this.name, this.imgName});

  factory Unit.fromSnapshot(DocumentSnapshot snapshot){
    return Unit(
      docId : snapshot.documentID,
      bookId : snapshot.data['bookId'],
      unitId: snapshot.data['unitId'],
      name: snapshot.data['name'],
      imgName: snapshot.data['imgName'],
    );
  }

  factory Unit.fromJson(Map<String, dynamic> data){
    return Unit(
      docId: data['id'],
      bookId : data['bookId'],
      unitId: data['unitId'],
      name: data['name'],
      imgName: data['imgName'],
    );
  }
}