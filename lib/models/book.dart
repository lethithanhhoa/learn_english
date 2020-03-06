import 'package:cloud_firestore/cloud_firestore.dart';

class Book{
  String docId;
  String bookId;
  String title;
  String imgName;

  Book({this.docId, this.bookId, this.title, this.imgName});

  factory Book.fromSnapshot(DocumentSnapshot snapshot){
    return Book(
      docId : snapshot.documentID,
      bookId : snapshot.data['bookId'],
      title: snapshot.data['bookTitle'],
      imgName: snapshot.data['imgName'],
    );
  }

  factory Book.fromJson(Map<String, dynamic> data){
    return Book(
      docId: data['id'],
      bookId : data['bookId'],
      title: data['bookTitle'],
      imgName: data['imgName'],
    );
  }
}